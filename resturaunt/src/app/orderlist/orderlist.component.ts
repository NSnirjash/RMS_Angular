import { Component, OnInit } from '@angular/core';
import { FoodModel } from '../model/food.model';
import { User } from '../model/user.model';
import { OrderModel } from '../model/order.model';
import { FoodService } from '../service/food.service';
import { OrderService } from '../service/order.service';
import { AuthService } from '../service/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-orderlist',
  templateUrl: './orderlist.component.html',
  styleUrl: './orderlist.component.css'
})
export class OrderlistComponent implements OnInit{

  foodList: FoodModel[] = [];  // To store available food items
  cart: { food: FoodModel, quantity: number }[] = [];  // Cart to store selected food items and quantities
  totalPrice: number = 0;  // Total price of the order
  user: User = new User()  // To store the logged-in user details
  orderList: OrderModel[] = [];

  userId!: number;

  staff!:any;

  constructor(
    private foodService: FoodService,
    private orderService: OrderService,
    private router: Router,
    private authService: AuthService
  ) { }
  ngOnInit(): void {
    this.loadOrderList();
  }


  loadOrderList(): void {
    this.orderService.getOrdersByUserId(this.userId).subscribe((orders) => {
      this.orderList = orders;
    });
  }



}
