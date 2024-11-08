import { Component } from '@angular/core';
import { ItemModel } from '../../model/menu.model';
import { OrderService } from '../../service/order.service';
import { MenuService } from '../../service/menu.service';
import { OrderModel } from '../../model/order.model';
import { CustomerModel } from '../../model/customer.model';
import { Router } from '@angular/router';
import { UserModel } from '../../model/user.model';
import { AuthService } from '../../service/auth.service';

@Component({
  selector: 'app-createorder',
  templateUrl: './createorder.component.html',
  styleUrl: './createorder.component.css'
})
export class CreateorderComponent {

  items: ItemModel[] = [];
  selectedItems: { item: ItemModel; quantity: number }[] = [];
  totalAmount: number = 0;
  customer: UserModel = new UserModel();

  constructor(
    private orderService: OrderService, 
    private authService: AuthService,
    private itemService: MenuService,
    private router: Router) {
      
    }


  ngOnInit(): void {
    this.itemService.getItems().subscribe((items) => {
      this.items = items.filter(item => item.available);
    });
  }

  addToOrder(item: ItemModel): void {
    const existingItem = this.selectedItems.find(i => i.item.id === item.id);
    if (existingItem) {
      existingItem.quantity += 1;
    } else {
      this.selectedItems.push({ item, quantity: 1 });
    }
    this.calculateTotal();
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
      return total + selectedItem.item.price * selectedItem.quantity;
    }, 0);
  }

  createOrder(): void {

    let userFromStorage = this.authService.getUserProfileFromStorage();
    if(userFromStorage == null) {
      alert('No customer found in local storage');
    }

    this.selectedItems.forEach(selectedItem => {
      selectedItem.item.quantity = selectedItem.quantity; // Set the quantity in ItemModel
    });

    const newOrder: OrderModel = {
      orderDate: new Date(),
      customer:  userFromStorage,
      items: this.selectedItems.map(si => si.item),
      totalAmount: this.totalAmount,
      status: 'Pending'
    };
    
    this.orderService.createOrder(newOrder).subscribe(() => {
      alert('Order created successfully!');
      this.router.navigate(['/orders']);
    });
  }

}
