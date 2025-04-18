# Jersey Flora Guide for Little Explorers

A child-friendly web application designed to inspire young naturalists and make learning about Jersey's native flora fun and interactive. This educational tool helps children and families discover, identify, and learn about the diverse trees and wildflowers found across Jersey's beautiful landscapes.

## About the Project

### Purpose
The Jersey Flora Guide aims to:
- Make nature exploration engaging and accessible for children
- Help families identify common trees and wildflowers in Jersey
- Promote environmental awareness and appreciation of local biodiversity
- Support outdoor learning and nature connection
- Preserve knowledge about Jersey's native plant species

### Target Audience
- Primary school children (ages 5-11)
- Families exploring nature together
- Teachers and educational groups
- Nature enthusiasts and beginners
- Visitors to Jersey interested in local flora

### Key Features
- Child-friendly descriptions and language
- Visual identification guides with high-quality images
- Interactive checklists for tracking discoveries
- Safety information for responsible nature exploration
- Educational resources and activities
- Mobile-friendly design for use during outdoor adventures

### Educational Value
The guide supports learning in various areas:
- Biology and plant science
- Local ecology and environmental studies
- Seasonal changes and plant life cycles
- Conservation and environmental stewardship
- Digital literacy through interactive features
- Outdoor education and nature connection

## Project Status

### Completed Features ✓

1. **Content Structure**
   - Comprehensive HTML structure with organized sections:
     - Navigation menu
     - Trees catalog (10 species)
     - Wildflowers catalog (9 species)
     - Interactive checklist
     - Resources section
     - Safety information

2. **Data Organization**
   - YAML files created for all plants:
     - Trees (10 files) in `data/plants/trees/`
     - Wildflowers (9 files) in `data/plants/wildflowers/`
     - Consistent structure with id, name, scientific name, features, etc.

3. **Asset Organization**
   - CSS separated into `assets/css/styles.css`
   - JavaScript separated into `assets/js/main.js`
   - Image structure defined in `assets/images/plants/`

### Current Directory Structure
```
Jersey_Flora_Guide/
├── main.html
├── README.md
├── assets/
│   ├── css/
│   │   └── styles.css
│   ├── js/
│   │   └── main.js
│   └── images/
│       └── plants/
│           ├── trees/
│           └── wildflowers/
└── data/
    └── plants/
        ├── trees/
        └── wildflowers/
```

## Roadmap

### 1. Server-Side Implementation
- [ ] Create server (Node.js/Python Flask)
- [ ] Implement YAML file parsing
- [ ] Set up dynamic HTML generation
- [ ] Configure routing system

### 2. Template System
- [ ] Convert main.html to template format
- [ ] Create reusable components
  - [ ] Plant cards
  - [ ] Navigation
  - [ ] Sections
- [ ] Implement dynamic data rendering

### 3. Image Management
- [ ] Set up image handling system
- [ ] Verify all referenced images
- [ ] Implement image optimization
- [ ] Add accessibility features

### 4. Database (Optional)
- [ ] Evaluate database needs
- [ ] Design schema if needed
- [ ] Implement user progress tracking
- [ ] Set up data persistence

### 5. Interactive Features
- [ ] Implement checklist persistence
- [ ] Add search functionality
- [ ] Add filtering options
- [ ] Create plant identification helper

### 6. Testing
- [ ] Create unit tests
- [ ] Implement integration tests
- [ ] Set up browser testing
- [ ] Test responsive design

### 7. Deployment
- [ ] Set up hosting
- [ ] Configure domain
- [ ] Install SSL certificate
- [ ] Configure server settings

### 8. Documentation
- [x] Create initial README
- [ ] Document API (if applicable)
- [ ] Add setup instructions
- [ ] Include maintenance guidelines

### 9. Performance & Optimization
- [ ] Implement caching
- [ ] Optimize assets
- [ ] Add service worker
- [ ] Implement lazy loading

### 10. Additional Features
- [ ] User accounts system
- [ ] Progress tracking
- [ ] Photo upload capability
- [ ] Social sharing
- [ ] Seasonal updates
- [ ] Interactive map

### 11. Accessibility
- [ ] Ensure WCAG compliance
- [ ] Add ARIA labels
- [ ] Implement keyboard navigation
- [ ] Add screen reader support

### 12. Progressive Web App
- [ ] Create manifest.json
- [ ] Implement service workers
- [ ] Enable offline functionality
- [ ] Add install prompts

## Getting Started

Currently, the project is in development phase. To view the current static version:

1. Clone the repository
2. Open `main.html` in a web browser

Note: Some features require server-side implementation and are not yet functional.

## Contributing

This project is currently in development. If you'd like to contribute, please check the roadmap above for areas that need attention.

### Areas Where Help is Needed
- Content writing and editing
- Image collection and processing
- User interface design
- Accessibility improvements
- Testing and bug reporting
- Translation to other languages (particularly French)

## License

[License information to be added]

## Acknowledgments

Special thanks to:
- Jersey Trees for Life - For their expertise and support
- The National Trust for Jersey - For access to locations and plant information
- Société Jersiaise - For historical and botanical reference
- Durrell Wildlife Conservation Trust - For conservation context
- Jersey Biodiversity Centre - For species data and verification
- Local educators and naturalists who provided guidance
- The young explorers who helped test and improve the guide

## Contact

[Contact information to be added]

---
Last Updated: [Current Date] 