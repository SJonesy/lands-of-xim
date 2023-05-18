#include <SDL.h>
#include <SDL_image.h>
#include <SDL_ttf.h>
#include <SDL_video.h>

int main(int argc, char* argv[])
{
    // Initialize SDL2
    SDL_Init(SDL_INIT_VIDEO);

    // Create the main window
    SDL_Window* window = SDL_CreateWindow("Lands of Xim", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
        0, 0, SDL_WINDOW_FULLSCREEN);

    // Calculate the areas for the top-left window and sidebar
    int window_width;
    int window_height;
    SDL_GetWindowSize(window, &window_width, &window_height);
    SDL_Rect top_left_window = { 0, 0, window_width * 2 / 3, window_height };
    SDL_Rect sidebar = { window_width * 2 / 3, 0, window_width / 3, window_height };

    // Create renderers for each area
    SDL_Renderer* top_left_renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    SDL_Renderer* side_bar_renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

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

        // Render to top-left window
        SDL_SetRenderDrawColor(top_left_renderer, 0, 0, 0, 255);
        SDL_RenderClear(top_left_renderer);
        SDL_SetRenderDrawColor(top_left_renderer, 255, 255, 0, 255);
        SDL_RenderFillRect(top_left_renderer, &top_left_window);

        // Render to sidebar
        SDL_SetRenderDrawColor(side_bar_renderer, 0, 0, 0, 255);
        SDL_RenderClear(side_bar_renderer);
        SDL_SetRenderDrawColor(side_bar_renderer, 0, 0, 255, 255);
        SDL_RenderFillRect(side_bar_renderer, &sidebar);

        // Present the renderers to the window
        SDL_RenderPresent(top_left_renderer);
        SDL_RenderPresent(side_bar_renderer);
    }

    // Clean up resources
    SDL_DestroyRenderer(top_left_renderer);
    SDL_DestroyRenderer(side_bar_renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
