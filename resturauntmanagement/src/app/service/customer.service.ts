import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CustomerModel } from '../model/customer.model';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  private apiUrl = 'http://localhost:3000/customer';

  constructor(private http: HttpClient) { 

  }

  getCustomers(): Observable<CustomerModel[]> {
    return this.http.get<CustomerModel[]>(this.apiUrl);
  }

  getCustomerById(id: string): Observable<CustomerModel> {
    return this.http.get<CustomerModel>(`${this.apiUrl}/${id}`);
  }

  createCustomer(customer: CustomerModel): Observable<CustomerModel> {
    return this.http.post<CustomerModel>(this.apiUrl, customer);
  }

  updateCustomer(id: string, customer: CustomerModel): Observable<CustomerModel> {
    return this.http.put<CustomerModel>(`${this.apiUrl}/${customer.customerId}`, customer);
  }

  deleteCustomer(id: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
