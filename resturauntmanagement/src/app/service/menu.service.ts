import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ItemModel } from '../model/menu.model';

@Injectable({
  providedIn: 'root'
})
export class MenuService {

  private apiUrl = 'http://localhost:3000/menu';

  constructor(private http:HttpClient) { 

  }

   // Get all items
   getItems(): Observable<ItemModel[]> {
    return this.http.get<ItemModel[]>(this.apiUrl);
  }

  // Get a single item by ID
  getItemById(id: string): Observable<ItemModel> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<ItemModel>(url);
  }

  // Create a new item
  createItem(item: ItemModel): Observable<ItemModel> {
    return this.http.post<ItemModel>(this.apiUrl, item, {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
    });
  }

  // Update an existing item
  updateItem(item: ItemModel): Observable<ItemModel> {
    const url = `${this.apiUrl}/${item.id}`;
    return this.http.put<ItemModel>(url, item, {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
    });
  }

  // Delete an item
  deleteItem(id: string): Observable<void> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<void>(url);
  }

  // Fetch all menu items(for Dropdown)
  getMenuItems(): Observable<ItemModel[]> {
    return this.http.get<ItemModel[]>(this.apiUrl);
  }

  // Fetch menu items by category(for dropdown)
  getMenuItemsByCategory(category: string): Observable<ItemModel[]> {
    const url = `${this.apiUrl}?category=${encodeURIComponent(category)}`;
    return this.http.get<ItemModel[]>(url);
  }
}



