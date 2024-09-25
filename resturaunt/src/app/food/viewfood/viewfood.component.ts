import { Component } from '@angular/core';
import { FoodModel } from '../../model/food.model';
import { FoodService } from '../../service/food.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-viewfood',
  templateUrl: './viewfood.component.html',
  styleUrl: './viewfood.component.css'
})
export class ViewfoodComponent {

  foods: FoodModel[] = [];
  filteredFoods: FoodModel[] = [];
  categories: string[] = [];
  selectedCategory: string = '';
  searchText: string = '';

  constructor(private foodService: FoodService, router: Router) { }

  ngOnInit(): void {
    this.getAllFoods();
  }

  getAllFoods(): void {
    this.foodService.getAllFood().subscribe({
      next: (data) => {
        this.foods = data;
        this.filteredFoods = data;
        this.extractCategories();
      },
      error: (err) => {
        console.error('Failed to fetch foods', err);
      }
    });
  }

  extractCategories(): void {
    this.categories = [...new Set(this.foods.map(food => food.category))];
  }

  filterByCategory(): void {
    if (this.selectedCategory) {
      this.filteredFoods = this.foods.filter(food => food.category === this.selectedCategory);
    } else {
      this.filteredFoods = this.foods;
    }
  }

  searchFood(): void {
    if (this.searchText.trim()) {
      this.filteredFoods = this.foods.filter(food =>
        food.name.toLowerCase().includes(this.searchText.toLowerCase())
      );
    } else {
      this.filterByCategory();
    }
  }

}
