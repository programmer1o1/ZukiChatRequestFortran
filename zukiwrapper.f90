! fortran thing

program zuki_api_wrapper
    implicit none

    ! Character variables to store API-related information
    character(len=256) :: api_key, model, system_message, user_message
    character(len=1024) :: api_url, curl_cmd
    character(len=4096) :: data, command

    ! Variables for handling the API response
    character(len=8192) :: result
    integer :: status, io_status
    character(len=256) :: temp_file = 'api_response.tmp'

    ! Set the API key (replace with your actual key)
    ! Join the Discord server at https://discord.gg/zukijourney to get an API key
    api_key = "your_own_api_key"

    ! Set the AI model to use
    ! Available models: gpt-3.5-turbo, gpt-3.5-turbo-instruct, gpt-3.5-turbo-16k, gpt-4, gpt-4-32k,
    !                   gpt-4-1106-preview, gpt-4-0125-preview, gpt-4-vision-preview, gpt-4o claude,
    !                   claude-2, claude-2.1, claude-instant-v1, claude-3-opus, claude-3.5-sonnet claude-instant-v1-100k,
    !                   pplx-70b-online, palm-2, bard, gemini-pro, gemini-pro-vision,
    !                   mixtral-8x7b, mixtral-8x7b-instruct, mistral-tiny, mistral-small,
    !                   mistral-medium, mistral-7b-instruct, codellama-7b-instruct, llama-2-7b,
    !                   llama-2-70b-chat, mythomax-l2-13b-8k, sheep-duck-llama, goliath-120b,
    !                   nous-llama2, yi-34b, openchat, solar10-7b, pi
    model = "gpt-3.5-turbo"

    ! Set the system message (initial context for the AI)
    system_message = "You are (not) a helpful assistant."

    ! Set the user message (the input prompt for the AI)
    user_message = "type shit"

    ! Set the API URL (Get your api key at https://discord.gg/zukijourney lol)
    api_url = "https://zukijourney.xyzbot.net/v1/chat/completions"

    ! Construct the data payload for the API request
    write(data, '(a)') '{"model":"' // trim(model) // '",' // &
                       '"messages":[' // &
                       '{"role":"system","content":"' // trim(system_message) // '"},' // &
                       '{"role":"user","content":"' // trim(user_message) // '"}' // &
                       ']}'

    ! Construct the curl command
    write(curl_cmd, '(a)') "curl -s -X POST " // trim(api_url) // &
                           " -H ""Content-Type: application/json"" " // &
                           " -H ""Authorization: Bearer " // trim(api_key) // """" // &
                           " -d '" // trim(data) // "'" // &
                           " -o " // trim(temp_file)

    ! Execute the curl command
    call execute_command_line(curl_cmd, wait=.true., exitstat=status)

    if (status /= 0) then
        print *, "Error executing curl command. Status: ", status
    else
        ! Read and print the response from the temporary file
        open(unit=10, file=temp_file, status='old', action='read', iostat=io_status)
        if (io_status == 0) then
            print *, "API Response:"
            do
                read(10, '(a)', iostat=io_status) result
                if (io_status /= 0) exit
                print *, trim(result)
            end do
            close(10)
        else
            print *, "Error opening temporary file"
        end if

        ! Delete the temporary file
        call execute_command_line("rm " // trim(temp_file), wait=.true.)
    end if

end program zuki_api_wrapper
