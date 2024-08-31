// order.model.ts
import { CustomerModel } from './customer.model';
import { ItemModel } from './menu.model';

export class OrderModel {
    orderId!: string;
    orderDate!: Date;
    customer!: CustomerModel; // Reference to the customer who placed the order
    items!: ItemModel[]; // List of items in the order
    totalAmount!: number; // Total amount for the order
    status!: string; // Order status (e.g., 'Pending', 'Confirmed', 'Delivered', etc.)
}
