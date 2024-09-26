// order.model.ts
export class Order {
    id: number;
    userId: number; // Reference to the User ID
    foodId: number; // Reference to the Food ID
    quantity: number;
    status: string; // PENDING, APPROVED, REJECTED, SERVED
    totalPrice: number;
}
