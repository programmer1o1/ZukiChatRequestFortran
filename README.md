# Fortran Zuki API Wrapper

This is a simple Fortran wrapper for the Zuki API, and that's basically it.

> [!IMPORTANT]  
> - This is an attempted or unfinished Zuki API Wrapper! (I might make image generation i dunno)
>
> - This code requires Linux environment, unless you have enough sanity to make it work in Windows. Mac might work? But I don't know.
>
> - It also can work with other API endpoints. Which means not only Zuki API but OpenAI, and other stuff too. (You do need to modify the API request tho but it is probably unnecessary at most.)

## Prerequisites

- Fortran compiler (e.g., gfortran)
- curl command (should be already in Linux tho)
- Zuki API key (obtainable from https://discord.gg/zukijourney)

## Setup

1. Clone this repository:
   ```
   git clone https://github.com/programmer1o1/ZukiChatRequestFortran.git
   cd fortran-zuki-api-wrapper
   ```

2. Open the `zuki_api_wrapper.f90` file in whatever text editor you like.

3. Replace `"your_own_api_key"` with your actual Zuki API key:
   ```fortran
   api_key = "your_own_api_key"
   ```

4. If you want, you can modify the `model`, `system_message`, and `user_message` like so:
   ```fortran
   model = "gpt-3.5-turbo"
   system_message = "You are a helpful assistant."
   user_message = "Hello! What can you do as an AI?"
   ```

## Compiling

To compile the program, use the following command:

```
gfortran -o zuki_wrapper zukiwrapper.f90
```

This will compile fortran to an executable named `zuki_wrapper`.

## Running

To run the program, simply execute:

```
./zuki_wrapper
```

And that's it! It should send curl command and you should have response from the API!
