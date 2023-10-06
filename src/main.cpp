#include <SDL.h>
#include <SDL_image.h>
#include <SDL_pixels.h>
#include <SDL_ttf.h>
#include <SDL_video.h>

int main(int argc, char* argv[])
{
    // Initialize SDL2
    SDL_Init(SDL_INIT_VIDEO);

    // Create the main window
    SDL_Window* window = SDL_CreateWindow("Lands of Xim", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
        0, 0, SDL_WINDOW_FULLSCREEN_DESKTOP);
    int window_width;
    int window_height;
    SDL_GetWindowSize(window, &window_width, &window_height);

    // Create main (center) window renderer
    SDL_Rect main_window;  
    main_window.x = (window_width - window_height) / 2;
    main_window.y = 0;
    main_window.h = window_height;
    main_window.w = window_height; // intentional, we're drawing a square
    SDL_Renderer* main_window_renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    // Create left panel renderer
    SDL_Rect left_panel;
    left_panel.x = 0;
    left_panel.y = 0;
    left_panel.w = (window_width - window_height) / 2;
    left_panel.h = window_height;

    // Create right panel renderer
    SDL_Rect right_panel;
    right_panel.x = main_window.x + main_window.w;
    right_panel.y = 0;
    right_panel.w = (window_width - window_height) / 2;
    right_panel.h = window_height;

/*  TODO: figure out drawing text
    TTF_Font* Sans = TTF_OpenFont("Sans.ttf", 24);
    SDL_Color White = {255, 255, 255};
    SDL_Surface* surfaceMessage = TTF_RenderText_Solid(Sans, "put your text here", White); 
    SDL_Texture* Message = SDL_CreateTextureFromSurface(main_window_renderer, surfaceMessage); 
*/

    // Game loop
    bool quit = false;
    SDL_Event event;
    while (!quit)
    {
        // Handle events
        while (SDL_PollEvent(&event) != 0)
        {
            if (event.type == SDL_QUIT
                || (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_q))
            {
                quit = true;
            }
        }

        // Render to main window
        SDL_SetRenderDrawColor(main_window_renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
        SDL_RenderClear(main_window_renderer);
        SDL_SetRenderDrawColor(main_window_renderer, 255, 255, 0, 255);
        SDL_RenderFillRect(main_window_renderer, &main_window);

        // Present the renderers to the window
        SDL_RenderPresent(main_window_renderer);
    }

    // Clean up resources
    SDL_DestroyRenderer(main_window_renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
