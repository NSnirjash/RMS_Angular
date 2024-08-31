import { Component, OnInit } from '@angular/core';
import { OrderModel } from '../../model/order.model';
import { OrderService } from '../../service/order.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-showorder',
  templateUrl: './showorder.component.html',
  styleUrl: './showorder.component.css'
})
export class ShoworderComponent implements OnInit {

  orders: OrderModel[] = [];
  orderId: string = '';

  constructor(
    private orderService: OrderService,
    private router: Router
  ) {
    
  }

  ngOnInit(): void {
    this.loadOrders();
    // Subscribe to the order update notifications
    this.orderService.getOrderUpdateListener().subscribe(() => {
      this.loadOrders();
    });
  }

  loadOrders(): void {
    this.orderService.getOrders().subscribe((orders) => {
      this.orders = orders;
    });
  }

  // deleteOrder(orderId: string): void {
  //   this.orderService.deleteOrder(orderId).subscribe(() => {
  //     this.orders = this.orders.filter(order => order.orderId !== orderId);
  //   });

  //   this.orderService.deleteOrder(this.orderId).subscribe(() => {
  //     alert('Order deleted successfully!');
  //     this.router.navigate(['/deleteorder']);

  //     // Redirect or update view
  //   });
  // }

  deleteOrder(orderId: string): void {
    this.orderService.deleteOrder(orderId).subscribe(() => {
      alert('Order deleted successfully!');
      this.orders = this.orders.filter(order => order.orderId !== orderId);
      // You can navigate or perform other actions here if needed
    }, error => {
      alert('Failed to delete order: ' + error.message);
    });
  }
  

  updateOrder(orderId: string): void {
    this.router.navigate(['/updateorder', orderId]);
  }


}
