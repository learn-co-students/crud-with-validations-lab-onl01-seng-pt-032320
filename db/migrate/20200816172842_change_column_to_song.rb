class ChangeColumnToSong < ActiveRecord::Migration[5.0]
  def change
    rename_column :songs, :release, :released
  end
end
