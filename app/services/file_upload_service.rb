class FileUploadService
  def initialize(file_params)
    @file = file_params[:file]
  end

  def create
    begin
      binding.pry
      # read CSV
      rows = CSV.read(@file.path)
      # convert headers
      headers = rows.shift
      # Generate contacts hash
      contacts = rows.map { |row| Hash[headers.zip(row)] }
      # Create albums in bulk
      Album.create(contacts)
    rescue StandardError
      return { status: 'failed', message: 'Please uplaod file with valid data' }
    end
    { status: 'success', message: 'Uploaded successfully.' }
  end
end
