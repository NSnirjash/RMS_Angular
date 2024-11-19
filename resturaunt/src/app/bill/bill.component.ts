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
export class BillComponent implements OnInit{
  
  approvedOrders: OrderModel[] = [];
  bills: BillModel[] = [];
  selectedOrderId!: number;
  userId!: number;
  adminId!: number;

  constructor(
    private billService: BillService,
    private orderService: OrderService,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  ngOnInit(): void {
    this.userId = this.authService.getUserId(); // Assuming userId is fetched via AuthService
    this.adminId = this.authService.getAdminId(); // Assuming adminId is fetched via AuthService
    this.loadApprovedOrders();
    this.loadBills();
  }

  loadApprovedOrders(): void {
    this.orderService.getOrdersByUserId(this.userId).subscribe(
      (orders) => {
        this.approvedOrders = orders.filter((order) => order.status === 'APPROVED');
      },
      (error) => console.error('Error fetching approved orders:', error)
    );
  }

  loadBills(): void {
    // Add logic to fetch bills if needed
  }

  createBill(orderId: number): void {
    this.billService.createBill(orderId, this.adminId).subscribe(
      (bill) => {
        alert('Bill created successfully!');
        this.loadApprovedOrders(); // Refresh orders
        this.bills.push(bill); // Add the new bill
      },
      (error) => console.error('Error creating bill:', error)
    );
  }

  payBill(billId: number): void {
    this.billService.payBill(billId).subscribe(
      (bill) => {
        alert('Bill paid successfully!');
        this.loadBills(); // Refresh bills
      },
      (error) => console.error('Error paying bill:', error)
    );
  }

  confirmBill(billId: number): void {
    this.billService.confirmBill(billId, this.adminId).subscribe(
      (bill) => {
        alert('Bill confirmed successfully!');
        this.loadBills(); // Refresh bills
      },
      (error) => console.error('Error confirming bill:', error)
    );
  }

}
