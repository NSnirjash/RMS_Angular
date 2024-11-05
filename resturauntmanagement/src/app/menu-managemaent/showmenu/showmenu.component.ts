import { Component, OnInit } from '@angular/core';
import { ItemModel } from '../../model/menu.model';
import { MenuService } from '../../service/menu.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-showmenu',
  templateUrl: './showmenu.component.html',
  styleUrl: './showmenu.component.css'
})
export class ShowmenuComponent implements OnInit {

  items: ItemModel[] = [];
  errorMessage: string = '';
  selectedCategory: string = ''; // Property to store the selected category
  categories: string[] = ['Fast Food', 'Main Course', 'Desserts', 'Drinks']; // Example categories(new)


  constructor(
    private itemService: MenuService,
    private router: Router,
    private http: HttpClient
  ) {

  }

  //old
  // ngOnInit(): void {
  //   this.fetchItems();
  // }

  //for dropdown:
  ngOnInit(): void {
    this.getMenuItems();
  }

  //for dropdown
  getMenuItems(): void {
    this.itemService.getMenuItems().subscribe(items => {
      this.items = items;
    });
  }

  //for dropdown
  onCategoryChange(category: string): void {
    this.selectedCategory = category; // Update the selected category
    if (category) {
      this.itemService.getMenuItemsByCategory(category).subscribe(items => {
        this.items = items; // Update the menu items based on the category
      });
    } else {
      this.getMenuItems(); // Fetch all items if no category is selected
    }
  }



//old
  // fetchItems(): void {
  //   this.itemService.getItems().subscribe(
  //     (data: ItemModel[]) => {
  //       this.items = data;
  //     },
  //     (error) => {
  //       this.errorMessage = 'Error fetching items. Please try again later.';
  //       console.error('Error fetching items:', error);
  //     }
  //   );
  // }


  //old
  updateMenu(itemId: string): void {
    this.router.navigate(['update', itemId]); // Update this path as needed
  }


  // old
  deleteMenu(itemId: string): void {  // Change return type to void
    this.itemService.deleteItem(itemId)
      .subscribe({
        next: () => {
          // Correct way to refresh items after deletion
          this.itemService.getItems().subscribe((data: ItemModel[]) => {
            this.items = data;
          });

          // Optional: Navigate to 'menu' route after deletion, if needed
          this.router.navigate(['menu']);
        },
        error: error => {
          console.log(error);
          this.errorMessage = 'Error deleting item. Please try again later.';
        }
      });
  }

}