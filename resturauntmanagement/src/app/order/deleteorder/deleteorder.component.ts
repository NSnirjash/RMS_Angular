import { Component } from '@angular/core';
import { OrderService } from '../../service/order.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-deleteorder',
  templateUrl: './deleteorder.component.html',
  styleUrl: './deleteorder.component.css'
})
export class DeleteorderComponent {
  
  orderId: string = '';

  constructor(private orderService: OrderService,
    private router: Router
  ) {}

  deleteOrder(orderId: string): void {
    this.orderService.deleteOrder(this.orderId).subscribe(() => {
      alert('Order deleted successfully!');
      this.router.navigate(['/deleteorder']);

      // Redirect or update view
    });
  }


}
