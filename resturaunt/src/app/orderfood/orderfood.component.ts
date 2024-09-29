import { Component } from '@angular/core';
import { FoodModel } from '../model/food.model';
import { FoodService } from '../service/food.service';
import { OrderService } from '../service/order.service';
import { Router } from '@angular/router';
import { OrderModel } from '../model/order.model';
import { AuthService } from '../service/auth.service';
import { User } from '../model/user.model';

@Component({
  selector: 'app-orderfood',
  templateUrl: './orderfood.component.html',
  styleUrl: './orderfood.component.css'
})
export class OrderfoodComponent {

  foodList: FoodModel[] = [];  // To store available food items
  cart: { food: FoodModel, quantity: number }[] = [];  // Cart to store selected food items and quantities
  totalPrice: number = 0;  // Total price of the order
  user: User = new User()  // To store the logged-in user details
  orderList: OrderModel[] = [];


  constructor(
    private foodService: FoodService, 
    private orderService: OrderService,  
    private router: Router,
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    let currentUser = this.authService.getUser();
    if (currentUser != null) {
      this.user = currentUser;
    }

    this.loadFoods();
    this.loadOrderList(); // Load previous orders if any
  }

  loadFoods(): void {
    this.foodService.getAllFood().subscribe((foods) => {
      this.foodList = foods;
    });
  }

  addToCart(food: FoodModel): void {
    const existingItem = this.cart.find(item => item.food.id === food.id);
    if (existingItem) {
      existingItem.quantity += 1;
    } else {
      this.cart.push({ food, quantity: 1 });
    }
    this.calculateTotalPrice();
  }

  removeFromCart(foodId: number): void {
    this.cart = this.cart.filter(item => item.food.id !== foodId);
    this.calculateTotalPrice();
  }

  updateQuantity(foodId: number, quantity: number): void {
    const item = this.cart.find(item => item.food.id === foodId);
    if (item) {
      item.quantity = quantity;
      this.calculateTotalPrice();
    }
  }

  calculateTotalPrice(): void {
    this.totalPrice = this.cart.reduce((acc, item) => acc + item.food.price * item.quantity, 0);
  }

  placeOrder(): void {
    this.cart.forEach(item => {
      const newOrder: OrderModel = {
        id: 0, // Id will be auto-generated
        user: this.user,
        food: item.food,
        quantity: item.quantity,
        totalPrice: item.food.price * item.quantity,
        status: 'PENDING', // Initial status
        admin: new User,
        staff: new User,
        notes: ''
      };
      
      this.orderService.createOrder(newOrder).subscribe((order) => {
        this.orderList.push(order); // Add the new order to the order list
      });
    });
    this.cart = []; // Clear cart after placing the order
    this.calculateTotalPrice();
  }

  loadOrderList(): void {
    this.orderService.getOrdersByUserId(this.user.id).subscribe((orders) => {
      this.orderList = orders;
    });
  }
}