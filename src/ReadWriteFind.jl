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


end # module ReadWriteFind
