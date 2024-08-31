<<<<<<< Updated upstream
import { HttpClient } from '@angular/common/http';
=======
import { HttpClient, HttpHeaders } from '@angular/common/http';
>>>>>>> Stashed changes
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CustomerModel } from '../model/customer.model';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {
<<<<<<< Updated upstream

  private apiUrl = 'http://localhost:3000/customer';

=======
  private apiUrl = "http://localhost:3000/customer"
>>>>>>> Stashed changes
  constructor(private http: HttpClient) { 

  }

  getCustomers(): Observable<CustomerModel[]> {
    return this.http.get<CustomerModel[]>(this.apiUrl);
  }

  getCustomerById(id: string): Observable<CustomerModel> {
    return this.http.get<CustomerModel>(`${this.apiUrl}/${id}`);
  }

  createCustomer(customer: CustomerModel): Observable<CustomerModel> {
<<<<<<< Updated upstream
    return this.http.post<CustomerModel>(this.apiUrl, customer);
  }

  updateCustomer(id: string, customer: CustomerModel): Observable<CustomerModel> {
    return this.http.put<CustomerModel>(`${this.apiUrl}/${customer.customerId}`, customer);
=======
    return this.http.post<CustomerModel>(this.apiUrl, customer, {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    });
  }

  updateCustomer(customer: CustomerModel): Observable<CustomerModel> {
    return this.http.put<CustomerModel>(`${this.apiUrl}/${customer.customerId}`, customer, {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    });
>>>>>>> Stashed changes
  }

  deleteCustomer(id: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
