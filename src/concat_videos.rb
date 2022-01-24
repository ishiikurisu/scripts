def itertree(item, inlet)
    outlet = inlet

    if File.directory? item
        Dir["#{item}/*"].each do |folder|
            outlet = itertree(folder, outlet)
        end
    else
        outlet << item
    end

    return outlet
end

def tree folder
    itertree folder, []
end

def convert_image_to_video image, output_file
    `ffmpeg -y -r 30 -loop 1 -i #{image} -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=48000 -shortest -c:v libx264 -t 1 -pix_fmt yuv420p #{output_file}`
end

def convert_images_to_video inlet
    outlet = []

    inlet.each do |item|
        file_name = item
        if item.include? "jpg"
            file_name = item.gsub "jpg", "mp4"
            convert_image_to_video item, file_name
        end
        outlet << file_name
    end

    return outlet
end

def create_concat_file video_list
    concat_file = "concat.txt"

    File.open("concat.txt", "w") do |fp|
        video_list.each do |v|
            fp.write("file #{v}\n")
        end
    end

    return concat_file
end

def concat_videos_with_ffmpeg concat_file, output_file
    `ffmpeg -y -r 30 -f concat -i #{concat_file} #{output_file}`
end

def delete_temporary_files file_list, concat_file
    `rm #{concat_file}`
    file_list.each do |item|
        if item.include? "jpg"
            file_name = item.gsub "jpg", "mp4"
            `rm #{file_name}`
        end
    end
end

def main argv
    input_folder = argv[0]
    output_file = argv[1]

    file_list = tree input_folder
    video_list = convert_images_to_video file_list
    concat_file = create_concat_file video_list
    concat_videos_with_ffmpeg concat_file, output_file

    delete_temporary_files file_list, concat_file
    puts `ffprobe #{output_file}`
end

if __FILE__ == $PROGRAM_NAME
    main ARGV
end
