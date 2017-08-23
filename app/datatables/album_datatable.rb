class AlbumDatatable
  delegate :params, to: :@view

  # Initlialize datatable with view.
  def initialize(view)
    @view = view
  end

  # Return data as json.
  def as_json(*)
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Album.count,
      iTotalDisplayRecords: albums.total_entries,
      aaData: data
    }
  end

  private

  # Build the required data.
  def data
    albums.map do |album|
      [
        album.artist,
        album.album,
        album.title,
        album.year,
        album.record_condition,
        album.id
      ]
    end
  end

  # Fetch all the albums.
  def albums
    @albums ||= fetch_albums
  end

  # Fetch all the albums
  # Also the columns are sorted according to the sort clicks.
  # Filter is applied to email so that email with
  # particular extension can be filtered out.
  def fetch_albums
    albums = Album.order("#{sort_column} #{sort_direction}")
    albums = albums.page(page).per_page(per_page)
    if params[:sSearch].present?
      albums = albums.where('artist like :search or album like :search or title
                             like :search or year like :search or record_condition like :search',
                             search: "%#{params[:sSearch]}%")
    end
    albums
  end

  def page
    params[:iDisplayStart].to_i / per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w(artist album title year record_condition)
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == 'desc' ? 'desc' : 'asc'
  end
end
