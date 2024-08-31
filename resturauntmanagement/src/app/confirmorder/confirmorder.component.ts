import { Component, OnInit } from '@angular/core';
import { OrderModel } from '../model/order.model';
import { OrderService } from '../service/order.service';

@Component({
  selector: 'app-confirmorder',
  templateUrl: './confirmorder.component.html',
  styleUrl: './confirmorder.component.css'
})

export class ConfirmorderComponent implements OnInit {
  orders: OrderModel[] = [];

  constructor(private orderService: OrderService) {

  }
  ngOnInit(): void {
    this.loadOrders();
  }

  loadOrders(): void {
    this.orderService.getAllOrders().subscribe((orders) => {
      this.orders = orders;
    });
  }

  // confirmOrder(order: OrderModel): void {
  //   order.status = 'Confirmed';
  //   this.orderService.updateOrder(order.orderId, order).subscribe(() => {
  //     alert('Order confirmed!');
  //     this.orderService.notifyOrderUpdated(); // Notify other components
  //     this.loadOrders(); // Reload orders after update
  //   });
  // }

  // cancelOrder(order: OrderModel): void {
  //   order.status = 'Canceled';
  //   this.orderService.updateOrder(order.orderId, order).subscribe(() => {
  //     alert('Order canceled!');
  //     this.orderService.notifyOrderUpdated(); // Notify other components
  //     this.loadOrders(); // Reload orders after update
  //   });
  // }


  confirmOrder(order: OrderModel): void {
    const updatedOrder = { ...order, status: 'Confirmed' };
    this.orderService.updateOrder(order.orderId, updatedOrder).subscribe(() => {
      alert('Order confirmed!');
      this.orderService.notifyOrderUpdated();
    });
  }

  cancelOrder(order: OrderModel): void {
    const updatedOrder = { ...order, status: 'Canceled' };
    this.orderService.updateOrder(order.orderId, updatedOrder).subscribe(() => {
      alert('Order canceled!');
      this.orderService.notifyOrderUpdated();
    });
  }
}


