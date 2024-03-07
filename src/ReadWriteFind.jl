module ReadWriteFind

function find_target_line_in_text_file(target_string, lines)

    for i in eachindex(lines)

        index=findfirst(target_string,lines[i])

        if isnothing(index)==false
            target_line = i
            return target_line
        end

    end

end

function read_text_file(filename)

    file = open(filename,"r")

    #Read all the lines.
    lines = readlines(file)
    
    close(file)

    return lines

end

function write_file(save_filename, lines)

    file = open(save_filename,"w")

    for i in eachindex(lines)
        write(file,"\n",lines[i])
    end

    close(file)

end


function find_phrase_in_string_chunk(string_chunk, search_name)

    chunk_numbers = Vector{Int}(undef, 0)
    for i in eachindex(string_chunk)

        if contains(string_chunk[i], search_name)
            push!(chunk_numbers, i)
        end

    end

    return chunk_numbers

end


function get_specific_string_chunk(string_chunk, search_name_start, start_offset, search_name_end, end_offset)

    chunk_numbers = ReadWriteFind.find_phrase_in_string_chunk(string_chunk, search_name_start)
    start_data_index = chunk_numbers[1] + start_offset

    string_chunk = string_chunk[start_data_index:end]

    chunk_numbers = ReadWriteFind.find_phrase_in_string_chunk(string_chunk, search_name_end)
    end_data_index = chunk_numbers[1] + end_offset

    chunk = string_chunk[1:end_data_index]

    return chunk

end


end # module ReadWriteFind
