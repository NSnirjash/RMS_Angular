import { OrderModel } from './order.model';

export class BillModel {
    billId !: number;
    orderId !: string;  // Reference to the associated order
    totalAmount !: number;
    billingDate !: Date;
    status !: string;  // e.g., 'Paid', 'Unpaid'
    orderDetails !: OrderModel; // Optional, include if you want more details
}    