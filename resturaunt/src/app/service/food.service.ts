import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { FoodModel } from '../model/food.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class FoodService {

  private apiUrl = 'http://localhost:8090/api/food';

  constructor(private http: HttpClient) { }

  // Fetch all food items
  getAllFood(): Observable<FoodModel[]> {
    return this.http.get<FoodModel[]>(`${this.apiUrl}/view`);
  }

  // Add new food with image
  saveFood(food: FoodModel, imageFile: File): Observable<any> {
    const formData: FormData = new FormData();
    formData.append('food', new Blob([JSON.stringify(food)], { type: 'application/json' }));
    formData.append('image', imageFile);

    return this.http.post(`${this.apiUrl}/save`, formData);
  }

  // Update an existing food item
  updateFood(food: FoodModel): Observable<any> {
    return this.http.put(`${this.apiUrl}/update/${food.id}`, food);
  }

  // Delete a food item by ID
  deleteFood(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/delete/${id}`);
  }

  // Fetch food by ID
  findFoodById(id: number): Observable<FoodModel> {
    return this.http.get<FoodModel>(`${this.apiUrl}/find/${id}`);
  }

}
