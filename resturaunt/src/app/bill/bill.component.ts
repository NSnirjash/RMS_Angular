import { Component, OnInit } from '@angular/core';
import { OrderModel } from '../model/order.model';
import { BillModel } from '../model/bill.model';
import { BillService } from '../service/bill.service';
import { OrderService } from '../service/order.service';
import { AuthService } from '../service/auth.service';

@Component({
  selector: 'app-bill',
  templateUrl: './bill.component.html',
  styleUrl: './bill.component.css'
})
export class BillComponent implements OnInit {
  approvedOrders: OrderModel[] = []; // Orders with APPROVED status
  userId!: number; // Logged-in user ID
  adminId!: number; // Logged-in admin ID
  isAdmin: boolean = false; // Role check for admin



  constructor(
    private billService: BillService,
    private orderService: OrderService,
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    // Fetch user details
    const user = this.authService.getUser();
    this.userId = user?.id ?? 0;
    this.adminId = user?.id ?? 0;
    // this.isAdmin = user?.role === 'ADMIN';

    // Load approved orders
    this.loadApprovedOrders();
  }



  // Fetch approved orders
  // Fetch approved orders
  loadApprovedOrders(): void {
    this.orderService.getOrdersByUserId(this.userId).subscribe(
      (orders) => {
        this.approvedOrders = orders.filter(order => order.status === 'APPROVED');
      },
      (error) => console.error('Error fetching approved orders:', error)
    );
  }

  // Fetch all bills
  loadBills(): void {

  }

  // Create a bill for an order (Admin-only)
  // Confirm bill for an order (Admin-only)
  confirmBill(orderId: number): void {
    if (!this.isAdmin) {
      alert('Only admins can confirm bills.');
      return;
    }
    this.billService.createBill(orderId, this.adminId).subscribe(
      (bill) => {
        this.billService.confirmBill(bill.id, this.adminId).subscribe(
          () => {
            alert('Bill confirmed successfully!');
            this.loadApprovedOrders(); // Refresh approved orders
          },
          (error) => console.error('Error confirming bill:', error)
        );
      },
      (error) => console.error('Error creating bill:', error)
    );
  }
}

