       
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            const heroContent = document.querySelector('.hero-content');
            
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
            
          
            const scrollPosition = window.scrollY;
            const fadeStart = window.innerHeight * 0.3;
            const fadeEnd = window.innerHeight * 0.8;
            const opacity = 1 - Math.min(1, Math.max(0, (scrollPosition - fadeStart) / (fadeEnd - fadeStart)));
            
            heroContent.style.opacity = opacity;
        });

      
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                if (targetId === '#') return;
                
                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop,
                        behavior: 'smooth'
                    });
                }
            });
        });