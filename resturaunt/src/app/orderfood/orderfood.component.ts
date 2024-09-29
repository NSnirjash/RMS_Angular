import { Component } from '@angular/core';
import { FoodModel } from '../model/food.model';
import { FoodService } from '../service/food.service';
import { OrderService } from '../service/order.service';
import { Router } from '@angular/router';
import { OrderModel } from '../model/order.model';
import { AuthService } from '../service/auth.service';

@Component({
  selector: 'app-orderfood',
  templateUrl: './orderfood.component.html',
  styleUrl: './orderfood.component.css'
})
export class OrderfoodComponent {

  foodItems: FoodModel[] = [];
  cart: { food: FoodModel; quantity: number; }[] = [];
  totalPrice: number = 0;
  currentUser: any;

  constructor(
    private foodService: FoodService, 
    private orderService: OrderService,  
    private router: Router,
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.foodService.getAllFood().subscribe((foods: FoodModel[]) => {
      this.foodItems = foods;
    });

    this.currentUser = this.authService.getUser();
  }

  addToCart(food: FoodModel): void {
    const existingOrder = this.cart.find(item => item.food.id === food.id);
    if (existingOrder) {
      existingOrder.quantity += 1; // Increment quantity
    } else {
      this.cart.push({ food, quantity: 1 }); // Add new food item to cart
    }
    this.calculateTotalPrice(); // Recalculate total price
  }

  calculateTotalPrice(): void {
    this.totalPrice = this.cart.reduce((total, order) => total + (order.food.price * order.quantity), 0);
  }

  updateQuantity(order: { food: FoodModel; quantity: number; }, quantity: number): void {
    order.quantity = quantity;
    this.calculateTotalPrice(); // Update total price on quantity change
  }

  orderNow(): void {
    // Create an array of OrderModel from the cart
    const orders: OrderModel[] = this.cart.map(order => ({
      food: order.food,
      quantity: order.quantity,
      user: this.currentUser,
      status: 'PENDING',
      totalPrice: order.food.price * order.quantity // Update total price in order
    }));

    // Call the createOrder method which expects an array of OrderModel
    this.orderService.createOrder(orders).subscribe(response => {
      alert('Orders placed successfully!');
      this.cart = []; // Clear cart after order
      this.totalPrice = 0; // Reset total price
    }, error => {
      console.error('Error placing orders:', error);
      alert('Failed to place orders.');
    });
  }
}