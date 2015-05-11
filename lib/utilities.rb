module Utilities
  class FileList

    def initialize(directory)
      fail ArgumentError, "Non-existent directory" unless Dir.exist?(directory)
      @dir = directory
    end

    def list
      files = []
      Dir.open(@dir) do
        ['*.png','*.gif','*.jpg','*.jpeg'].each do |format|
          files << Dir.glob(format, File::FNM_CASEFOLD)
        end
      end
      files.flatten
    end
  end

  class IndexPage

    def initialize(file_list)
      @files = file_list
    end

    def images
      image_list = []
      @files.each do |file|
        image_list << "<img src='#{file}' alt='#{file}'/>"
      end
      image_list
    end

    def make_page
      "<html><head><style type='text/css'>img { margin: 1em; }</style>
      </head><body>
      #{images.join(' ')}
      </body></html>"
    end
  end
end
