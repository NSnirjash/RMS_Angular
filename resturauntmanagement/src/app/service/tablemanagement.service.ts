import { Injectable } from '@angular/core';
import { Table } from '../model/table.model';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TablemanagementService {

  private apiUrl = 'http://localhost:3000/table'; // Replace with your actual backend URL

  constructor(private http: HttpClient) { 

  }

  // Get all tables
  getTables(): Observable<Table[]> {
    return this.http.get<Table[]>(this.apiUrl);
  }

   // Request to reserve a table
   requestReservation(table: Table,  reservationTime: Date): Observable<Table> {
    table.status = 'requested';
    table.isApproved = false;
    table.reservationTime = reservationTime;  // Set reservation time
    return this.http.put<Table>(`${this.apiUrl}/${table.id}`, table);
  }

  // Approve a reservation request
  approveReservation(table: Table): Observable<Table> {
    table.status = 'reserved';
    table.isApproved = true;
    return this.http.put<Table>(`${this.apiUrl}/${table.id}`, table);
  }

  // Delete a reservation request
  deleteReservation(table: Table): Observable<void> {
    table.status = 'available';
    table.isApproved = false;
    return this.http.put<void>(`${this.apiUrl}/${table.id}`, table);
  }

  // Free a table
  freeTable(table: Table): Observable<Table> {
    table.status = 'available';
    table.isApproved = false;
    table.reservationTime = null; // Clear reservation time
    return this.http.put<Table>(`${this.apiUrl}/${table.id}`, table);
  }
}
