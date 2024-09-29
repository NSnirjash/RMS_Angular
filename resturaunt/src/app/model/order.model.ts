import { FoodModel } from "./food.model";
import { User } from "./user.model";

// order.model.ts
export class OrderModel {
    id!: number;
    user!: User;   // User object for the customer placing the order
    food!: FoodModel;   // Food object for the food item being ordered
    quantity!: number; // Quantity of the food item
    status!: string;   // Status of the order (PENDING, APPROVED, REJECTED, SERVED)
    totalPrice!: number; // Total price of the order
}
