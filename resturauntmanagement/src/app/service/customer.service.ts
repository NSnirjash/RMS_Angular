import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UserModel } from '../model/user.model';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  private apiUrl = 'http://localhost:3000/user';

  constructor(private http: HttpClient) { 

  }

  getCustomers(): Observable<UserModel[]> {
    return this.http.get<UserModel[]>(this.apiUrl);
  }

  getCustomerById(id: number): Observable<UserModel> {
    return this.http.get<UserModel>(`${this.apiUrl}/${id}`);
  }

  createCustomer(customer: UserModel): Observable<UserModel> {
    return this.http.post<UserModel>(this.apiUrl, customer);
  }

  updateCustomer(id: number, customer: UserModel): Observable<UserModel> {
    return this.http.put<UserModel>(`${this.apiUrl}/${customer.id}`, customer);
  }

  deleteCustomer(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
