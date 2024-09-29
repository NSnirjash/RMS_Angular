import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { OrderModel } from '../model/order.model';
import { catchError, Observable, throwError } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  private apiUrl = 'http://localhost:8090/api/orders';

  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) { }

  // Get Bearer token
  private getAuthHeaders(): HttpHeaders {
    const token = this.authService.getToken();
    console.log(token);
    return new HttpHeaders({
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    });
  }

  createOrder(order: OrderModel): Observable<OrderModel> {

    const token = this.authService.getToken();
    console.log('Token:', token); // Verify token
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
      // 'Content-Type' is not needed here
    });
    console.log(headers);
    return this.http.post<OrderModel>(`${this.apiUrl}/create`, order, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  getAllOrders(): Observable<OrderModel[]> {
    return this.http.get<OrderModel[]>(`${this.apiUrl}/all`);
  }

  getOrdersByUserId(userId: number): Observable<OrderModel[]> {
    return this.http.get<OrderModel[]>(`${this.apiUrl}/user/${userId}`);
  }

  getOrderById(id: number): Observable<OrderModel> {
    return this.http.get<OrderModel>(`${this.apiUrl}/${id}`);
  }

  updateOrderStatus(id: number, status: string): Observable<OrderModel> {
    const headers = this.getAuthHeaders();
    return this.http.put<OrderModel>(`${this.apiUrl}/update/${id}?status=${status}`, {}, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  approveOrder(id: number, adminId: number, staffId: number): Observable<void> {
    const headers = this.getAuthHeaders();
    return this.http.delete<void>(`${this.apiUrl}/approve/${id}?adminId=${adminId}&staffId=${staffId}`, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  serveOrder(id: number): Observable<void> {
    const headers = this.getAuthHeaders();
    return this.http.delete<void>(`${this.apiUrl}/delete/${id}`, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  rejectOrder(id: number, adminId: number): Observable<void> {
    const headers = this.getAuthHeaders();
    return this.http.delete<void>(`${this.apiUrl}/reject/${id}?adminId=${adminId}`, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  deleteOrder(id: number): Observable<void> {
    const headers = this.getAuthHeaders();
    return this.http.delete<void>(`${this.apiUrl}/delete/${id}`, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  private handleError(error: any) {
    console.error('An error occurred:', error);
    return throwError(() => new Error(error.message || 'Server Error'));
  }
}
