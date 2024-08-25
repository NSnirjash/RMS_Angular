import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MenuService } from '../../service/menu.service';
import { ItemModel } from '../../model/menu.model';

@Component({
  selector: 'app-updatemenu',
  templateUrl: './updatemenu.component.html',
  styleUrl: './updatemenu.component.css'
})
export class UpdatemenuComponent implements OnInit {

  updateForm!: FormGroup;
  itemId!: string;
  categories: string[] = ['Fast Food', 'Main Course', 'Dessert', 'Drinks'];
  selectedFile: File | null = null;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private menuService: MenuService,
    private fb: FormBuilder
  ) {

  }
  ngOnInit(): void {
    this.itemId = this.route.snapshot.paramMap.get('id')!;
    this.updateForm = this.fb.group({
      item: ['', Validators.required],
      category: ['', Validators.required],
      price: ['', Validators.required],
      image: ['', Validators.required],
      available: [false]
    });

    this.menuService.getItemById(this.itemId).subscribe(
      (item: ItemModel) => {
        this.updateForm.patchValue(item);
      },
      (error) => {
        console.error('Error fetching item:', error);
      }
    );
  }

  onFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      this.selectedFile = input.files[0];
      // Handle file input logic here, e.g., upload or preview
      const reader = new FileReader();
      reader.onload = (e: any) => {
        this.updateForm.patchValue({ image: e.target.result });
      };
      reader.readAsDataURL(this.selectedFile);
    }
  }

  updateLocation(): void {
    if (this.updateForm.valid) {
      const updatedItem: ItemModel = { id: this.itemId, ...this.updateForm.value };
      this.menuService.updateItem(updatedItem).subscribe(
        () => {
          console.log('Item updated successfully');
          this.router.navigate(['/menu']);
        },
        (error) => {
          console.error('Error updating item:', error);
        }
      );
    }
  }

}

 


