require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_artists_table
    reset_albums_table
  end

  context "GET /albums" do
    it "returns all albums" do
      response = get("/albums")

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Albums</h1>')
      expect(response.body).to include("Title: Doolittle")
      expect(response.body).to include("Released: 1989")
      expect(response.body).to include("Title: Surfer Rosa")
      expect(response.body).to include("Released: 1988")
      expect(response.body).to include('<a href="/albums/1')
    end
  end

  context "POST /albums" do
    it 'returns 400 if invalid parameters are passed' do
      response = post("/albums", invalid_title: "Hi", invalid_year: 2022)

      expect(response.status).to eq 400
    end

    it 'returns 200 OK and adds an album to the database' do
      response = post("/albums", title: "Voyage", release_year: "2022", artist_id: "2")
      expect(response.status).to eq(200)
      expect(response.body).to include "Voyage has been added to albums list."
    end
  end

  context "POST /artists" do
    it "returns 200 OK and adds an artist to the database" do
      response = post("/artists", name: "Wild Nothing", genre: "Indie")
      expect(response.status).to eq 200
      expect(response.body).to include "Wild Nothing has been added to artists list."
    end
  end

  context "GET /albums/:id" do
    it "returns correct html for id 1" do
      response = get('/albums/1')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Doolittle</h1>')
      expect(response.body).to include('Release year: 1989')
      expect(response.body).to include('Artist: Pixies')
    end

    it "returns correct html for id 2" do
      response = get('/albums/2')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end
  end

  context "GET /artists/:id" do
    it "returns correct html for id 1" do
      response = get('/artists/1')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Pixies</h1>')
      expect(response.body).to include('Genre: Rock')
    end
    it "returns correct html for id 2" do
      response = get('artists/2')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>ABBA</h1>')
      expect(response.body).to include('Genre: Pop')
    end
  end

  context "GET /artists" do
    it 'returns correect html for artists list' do
      response = get('/artists')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Artists</h1>')
      expect(response.body).to include('ABBA')
      expect(response.body).to include('Pixies')
      expect(response.body).to include('<a href="/artists/3"')
    end
  end

  context "GET /artists/new" do
    it 'adds an artist to the database' do
      response = get('/artists/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<form method="POST" action="/artists"')
      expect(response.body).to include('<input type="text" name="name">')
      expect(response.body).to include('<input type="text" name="genre">')
    end
  end

  context "GET /albums/new" do
    it 'adds an album to the database' do
      response = get('/albums/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<form method="POST" action="/albums"')
      expect(response.body).to include('<input type="text" name="title">')
      expect(response.body).to include('<input type="text" name="release_year">')
    end
  end
end