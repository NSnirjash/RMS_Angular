import { OrderModel } from "./order.model";

export class OrderDetailsModel {

    id!: number;
    finalPrice!: number;
    orders?: OrderModel[];

}