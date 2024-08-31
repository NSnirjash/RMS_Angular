import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, Subject, tap } from 'rxjs';
import { OrderModel } from '../model/order.model';
import { ItemModel } from '../model/menu.model';
import { CustomerModel } from '../model/customer.model';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  private apiUrl = 'http://localhost:3000/orders';
  private orderUpdated = new Subject<void>();
  private ordersSubject = new BehaviorSubject<OrderModel[]>([]);


  // Fetch all available items
  constructor(private http: HttpClient) {
    this.loadOrders();
  }

  private loadOrders(): void {
    this.http.get<OrderModel[]>(this.apiUrl).subscribe((orders) => {
      this.ordersSubject.next(orders);
    });
  }

  getOrders(): Observable<OrderModel[]> {
    return this.ordersSubject.asObservable(); // Return as observable
  }

  // getOrders(): Observable<OrderModel[]> {
  //   return this.http.get<OrderModel[]>(this.apiUrl);
  // }

  getOrderById(orderId: string): Observable<OrderModel> {
    return this.http.get<OrderModel>(`${this.apiUrl}/${orderId}`);
  }

  createOrder(order: OrderModel): Observable<OrderModel> {
    return this.http.post<OrderModel>(this.apiUrl, order);
  }

  // updateOrder(orderId: string, order: OrderModel): Observable<OrderModel> {
  //   return this.http.put<OrderModel>(`${this.apiUrl}/${orderId}`, order);
  // }

  // deleteOrder(orderId: string): Observable<void> {
  //   return this.http.delete<void>(`${this.apiUrl}/${orderId}`);
  // }




 updateOrder(orderId: string, order: OrderModel): Observable<OrderModel> {
    return this.http.put<OrderModel>(`${this.apiUrl}/${orderId}`, order).pipe(
      tap((updatedOrder) => {
        // Find the order and update it
        const currentOrders = this.ordersSubject.getValue();
        const index = currentOrders.findIndex(o => o.orderId === orderId);
        if (index > -1) {
          currentOrders[index] = updatedOrder;
          this.ordersSubject.next(currentOrders); // Notify subscribers
        }
      })
    );
  }

  deleteOrder(orderId: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${orderId}`).pipe(
      tap(() => {
        const currentOrders = this.ordersSubject.getValue();
        const updatedOrders = currentOrders.filter(o => o.orderId !== orderId);
        this.ordersSubject.next(updatedOrders); // Notify subscribers
      })
    );
  }

  getAllOrders(): Observable<OrderModel[]> {
    return this.http.get<OrderModel[]>(this.apiUrl);
  }


  // Notify components of order updates
  notifyOrderUpdated(): void {
    this.orderUpdated.next();
  }

  // Observable to subscribe to for order updates
  getOrderUpdateListener(): Observable<void> {
    return this.orderUpdated.asObservable();
  }
}
