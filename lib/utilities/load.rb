class Load
  def initialize(file_path, loader_method)
    @file_path = file_path
    @loader_method = loader_method
  end

  def execute
    return [] unless File.exist?(@file_path)

    json_data = JSON.parse(File.read(@file_path))
    json_data.map { |data| send(@loader_method, data) }
  end

  private

  def load_games_from_json(data)
    Game.new(data['publish_date'], multiplayer: data['multiplayer'], last_played_at: data['last_played_at'], id: data['id'])
  end
end
