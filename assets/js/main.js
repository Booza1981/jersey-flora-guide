document.addEventListener('DOMContentLoaded', function() {
    // Navigation Menu Toggle
    const navToggle = document.querySelector('.nav-toggle');
    const navMenu = document.querySelector('.nav-menu');
    
    navToggle.addEventListener('click', function() {
        navMenu.classList.toggle('active');
    });

    // Section Headers Toggle
    const sectionHeaders = document.querySelectorAll('.section-header');
    
    sectionHeaders.forEach(header => {
        header.addEventListener('click', function(e) {
            e.preventDefault();
            this.classList.toggle('expanded');
            const submenu = this.nextElementSibling;
            submenu.classList.toggle('expanded');
        });
    });

    // Back to Top Button
    const backToTopButton = document.querySelector('.back-to-top');
    
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            backToTopButton.classList.add('visible');
        } else {
            backToTopButton.classList.remove('visible');
        }
    });

    backToTopButton.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // Active Link Highlighting
    const links = document.querySelectorAll('.nav-menu a:not(.section-header)');
    const sections = document.querySelectorAll('[id]');

    function setActiveLink() {
        let currentSection = '';
        const scrollPosition = window.pageYOffset;
        
        sections.forEach(section => {
            const sectionTop = section.offsetTop - 100;
            const sectionHeight = section.clientHeight;
            
            if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
                currentSection = section.id;
            }
        });

        links.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === '#' + currentSection) {
                link.classList.add('active');
                
                // Expand parent menu if link is active
                const parentUl = link.closest('ul');
                const parentHeader = parentUl.previousElementSibling;
                if (parentHeader && parentHeader.classList.contains('section-header')) {
                    parentHeader.classList.add('expanded');
                    parentUl.classList.add('expanded');
                }
            }
        });
    }

    window.addEventListener('scroll', setActiveLink);
    setActiveLink();

    // Close menu when clicking outside
    document.addEventListener('click', function(event) {
        const isClickInside = navMenu.contains(event.target) || navToggle.contains(event.target);
        
        if (!isClickInside && navMenu.classList.contains('active') && window.innerWidth < 768) {
            navMenu.classList.remove('active');
        }
    });

    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth >= 768) {
            navMenu.classList.add('active');
        } else {
            navMenu.classList.remove('active');
        }
    });

    // Initialize menu state based on window width
    if (window.innerWidth >= 768) {
        navMenu.classList.add('active');
    }

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            if (this.classList.contains('section-header')) return;
            
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
                
                // Close menu on mobile after clicking a link
                if (window.innerWidth < 768) {
                    navMenu.classList.remove('active');
                }
            }
        });
    });
}); 