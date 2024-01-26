// app/assets/javascripts/active_admin.js
function setupEventListeners() {

  const pageSelect = document.getElementById('cms_page_select');
  const sectionSelect = document.getElementById('cms_section_select');
  const componentSelect = document.getElementById('cms_component_select');
  const imageInput = document.getElementById('image_input');
  const valueInput = document.getElementById('value_input');
 

  if (pageSelect) {
    pageSelect.addEventListener('change', function() {
      fetch(`/cms_values/dropdownlist_sections_for_page/${this.value}`)
              .then(response => response.json())
              .then(sections => {
                updateDropdown(sectionSelect, sections);
                sectionSelect.disabled = false;
                componentSelect.innerHTML = '';
                componentSelect.disabled = true;
              });
           });
  } else {
  }

  if (sectionSelect) {
    sectionSelect.addEventListener('change', function() {
      console.log("Section selection changed to: ", this.value);
      fetch(`/cms_values/dropdownlist_components_for_section/${this.value}`)
              .then(response => response.json())
              .then(components => {
                updateDropdown(componentSelect, components);
                componentSelect.disabled = false;
              });   
             });
  } else {
  }
  if (componentSelect) {
    componentSelect.addEventListener('change', function() {
      fetch(`/cms_values/${this.value}/is_image_component`)
        .then(response => response.json())
        .then(data => {
            if (data.is_image_component) {
              imageInput.style.display = 'block';
              valueInput.style.display = 'none';
            } else {
              imageInput.style.display = 'none';
              valueInput.style.display = 'block';
            }
        })
        .catch(error => console.error('Error:', error));
    });
  }
  
}


// function updateFormFieldBasedOnComponent(componentId) {
//   fetch(`/cms_values/is_image_component/${componentId}`)
//   .then(response => response.json())
//   .then(data => {
//     const imageInput = document.getElementById('image_input');
//     const valueInput = document.getElementById('value_input');

//       if (data.is_image_component) {
//         console.log("java script is an image")
//         imageInput.style.display = 'block';
//         valueInput.style.display = 'none';
//       } else {
//         console.log("java script is an text")
//         imageInput.style.display = 'none';
//         valueInput.style.display = 'block';
//       }
//   });
// }
// Execute the setup function directly
// Delay the execution of the setup function
setTimeout(setupEventListeners, 1000); 

// For debugging: Call this function in the browser console if needed
function testDirectExecution() {
  setupEventListeners();
}

  function updateDropdown(dropdown, items) {
    console.log("Updating dropdown with items:", items);
    dropdown.innerHTML = '';
    items.forEach(item => {
      const option = new Option(item.name, item.id);
      dropdown.appendChild(option);
    });
  }
// console.log("Active Admin JS loaded");
// console.log(document.getElementById('cms_page_select'));

// document.addEventListener('turbolinks:load', function() {
//   console.log(document.getElementById('cms_page_select'));
//   console.log("inside turbolinks:load event listener");
//   const pageSelect = document.getElementById('cms_page_select');
//   const sectionSelect = document.getElementById('cms_section_select');
//   const componentSelect = document.getElementById('cms_component_select');

//   if (pageSelect) {
//     pageSelect.addEventListener('change', function() {
//       console.log("Page selection changed to: ", this.value);
//       fetch(`/cms_values/dropdownlist_sections_for_page/${this.value}`)
//         .then(response => response.json())
//         .then(sections => {
//           updateDropdown(sectionSelect, sections);
//           sectionSelect.disabled = false;
//           componentSelect.innerHTML = '';
//           componentSelect.disabled = true;
//         });
//     });
//   } else {
//     console.log("Page select element not found");
//   }

//   if (sectionSelect) {
//     sectionSelect.addEventListener('change', function() {
//       console.log("Section selection changed to: ", this.value);
//       fetch(`/cms_values/dropdownlist_components_for_section/${this.value}`)
//         .then(response => response.json())
//         .then(components => {
//           updateDropdown(componentSelect, components);
//           componentSelect.disabled = false;
//         });
//     });
//   } else {
//     console.log("Section select element not found");
//   }

//   function updateDropdown(dropdown, items) {
//     console.log("Updating dropdown with items:", items);
//     dropdown.innerHTML = '';
//     items.forEach(item => {
//       const option = new Option(item.name, item.id);
//       dropdown.appendChild(option);
//     });
//   }

// });
