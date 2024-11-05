// order.model.ts
import { CustomerModel } from './customer.model';
import { ItemModel } from './menu.model';
import { UserModel } from './user.model';

export class OrderModel {
    id?: string;
    orderDate!: Date;
    customer!: UserModel | null; // Reference to the customer (User) who placed the order
    items!: ItemModel[]; // List of items in the order
    totalAmount!: number; // Total amount for the order
    status!: string; // Order status (e.g., 'Pending', 'Confirmed', 'Delivered', etc.)
}
