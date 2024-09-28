import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TableBooking } from '../model/tablebooking.model';
import { Observable } from 'rxjs';
import { TableModel } from '../model/table.model';

@Injectable({
  providedIn: 'root'
})
export class TablebookingService {

  private apiUrl = 'http://localhost:8090/api/bookings';

  constructor(private http: HttpClient) { }

  // Fetch all table bookings
  getAllTables(): Observable<TableModel[]> {
    return this.http.get<TableModel[]>('http://localhost:8090/api/tables/view');
  }

   // Get all bookings
   getAllBookings(): Observable<TableBooking[]> {
    return this.http.get<TableBooking[]>(`${this.apiUrl}/allbooking`);
  }

  // Fetch a single booking by ID
  getBookingById(id: number): Observable<TableBooking> {
    return this.http.get<TableBooking>(`${this.apiUrl}/${id}`);
  }

  // Get bookings for a specific user
  getUserBookings(userId: number): Observable<TableBooking[]> {
    return this.http.get<TableBooking[]>(`${this.apiUrl}/user/${userId}`);
  }

  // Create a new booking
  createBooking(booking: TableBooking): Observable<TableBooking> {
    return this.http.post<TableBooking>(`${this.apiUrl}/create`, booking);
  }

  // Update a booking
  updateBooking(bookingId: number, userId: number, tableId: number): Observable<TableBooking> {
    return this.http.put<TableBooking>(`${this.apiUrl}/update/${bookingId}?userId=${userId}&tableId=${tableId}`, {});
  }

  // Cancel a booking
  cancelBooking(bookingId: number): Observable<string> {
    return this.http.delete<string>(`${this.apiUrl}/cancel/${bookingId}`);
  }

  // Get all pending bookings
  getPendingBookings(): Observable<TableBooking[]> {
    return this.http.get<TableBooking[]>(`${this.apiUrl}/pending`);
  }
}
