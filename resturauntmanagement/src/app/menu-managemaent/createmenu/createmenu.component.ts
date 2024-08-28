import { Component } from '@angular/core';
import { ItemModel } from '../../model/menu.model';
import { MenuService } from '../../service/menu.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-createmenu',
  templateUrl: './createmenu.component.html',
  styleUrl: './createmenu.component.css'
})
export class CreatemenuComponent {

  newItem: ItemModel = {
    id:'' ,
    item: '',
    category: '',
    price: '',
    image: '',
    available: false
  };

  constructor(
    private menuService: MenuService,
    private router: Router) {

  }

  onFileSelected(event: Event) {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
      const file = input.files[0];
      const reader = new FileReader();
      reader.onload = () => {
        this.newItem.image = reader.result as string; // Convert file to base64 string
      };
      reader.readAsDataURL(file); // Read the file as a Data URL
    }
  }

  onSubmit() {
    this.menuService.createItem(this.newItem).subscribe({
      next: () => {
        alert('Item created successfully!');
        this.router.navigate(['/menu']); // Navigate to the menu list or home after creation
      },
      error: (error) => {
        console.error('There was an error creating the item!', error);
      }
    });
  }

}


