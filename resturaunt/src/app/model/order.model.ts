import { BillModel } from "./bill.model";
import { FoodModel } from "./food.model";
import { OrderDetailsModel } from "./orderdetails.model";
import { User } from "./user.model";

// order.model.ts
export class OrderModel {
    id!: number;             // Unique identifier for the order
    user!: User;             // User object representing the customer placing the order
    food!: FoodModel;        // Food object representing the food item being ordered
    quantity!: number;       // Quantity of the food item
    status!: string;         // Status of the order (PENDING, APPROVED, REJECTED, SERVED)
    totalPrice!: number;     // Total price of the order (quantity * food price)
    admin?: User;            // Optional Admin user who approves the order
    staff?: User;            // Optional Staff user who serves the food
    notes?: string;          // Any additional notes related to the order
    bill?: BillModel;        // Bill object for the order (optional, only if bill is generated)
    orderDetails!: OrderDetailsModel; // The OrderDetails object that groups this order
}
