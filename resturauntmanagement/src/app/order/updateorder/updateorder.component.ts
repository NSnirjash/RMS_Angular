import { Component, Input, OnInit } from '@angular/core';
import { OrderModel } from '../../model/order.model';
import { OrderService } from '../../service/order.service';
import { CustomerModel } from '../../model/customer.model';
import { ItemModel } from '../../model/menu.model';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-updateorder',
  templateUrl: './updateorder.component.html',
  styleUrl: './updateorder.component.css'
})
export class UpdateorderComponent implements OnInit {
  
  order!: OrderModel;
  selectedItems: { item: ItemModel; quantity: number }[] = [];
  totalAmount: number = 0;
  
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private orderService: OrderService
  ) {

  }

  ngOnInit(): void {
    const orderId = this.route.snapshot.paramMap.get('id');
    if (orderId) {
      this.orderService.getOrderById(orderId).subscribe(order => {
        this.order = order;
        this.selectedItems = order.items.map(item => ({
          item,
          quantity: 1 // default quantity, update with actual if stored
        }));
        this.calculateTotal();
      });
    }
  }

  changeQuantity(item: ItemModel, quantity: number): void {
    const selectedItem = this.selectedItems.find(i => i.item.id === item.id);
    if (selectedItem) {
      selectedItem.quantity = quantity;
      this.calculateTotal();
    }
  }

  calculateTotal(): void {
    this.totalAmount = this.selectedItems.reduce((total, selectedItem) => {
      return total + (selectedItem.item.price * selectedItem.quantity);
    }, 0);
  }

  updateOrder(): void {
    const orderId = this.route.snapshot.paramMap.get('orderId');
    if (orderId) {
      // Update the order with the new items and quantities
      this.order.items = this.selectedItems.map(si => si.item);
      this.order.totalAmount = this.totalAmount;

      this.orderService.updateOrder(orderId, this.order).subscribe(() => {
        alert('Order updated successfully!');
        this.router.navigate(['/orders']); // Redirect to the orders list page
      });
    }
  }

}
