import { Component, OnInit } from '@angular/core';
import { ItemModel } from '../../model/menu.model';
import { MenuService } from '../../service/menu.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-showmenu',
  templateUrl: './showmenu.component.html',
  styleUrl: './showmenu.component.css'
})
export class ShowmenuComponent implements OnInit{

  items: ItemModel[] = [];
  errorMessage: string = '';

  constructor(
    private itemService: MenuService,
    private router: Router,
    private http: HttpClient
  ){

  }
  ngOnInit(): void {
    this.fetchItems();
  }

  fetchItems(): void {
    this.itemService.getItems().subscribe(
      (data: ItemModel[]) => {
        this.items = data;
      },
      (error) => {
        this.errorMessage = 'Error fetching items. Please try again later.';
        console.error('Error fetching items:', error);
      }
    );
  }

  updateLocation(itemId: string): void {
    this.router.navigate(['update', itemId]); // Update this path as needed
  }
}
