<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>MovieVault | Movie Catalog</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #111827;
            color: white;
        }

        header {
            background: #0f172a;
            padding: 20px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #374151;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
        }

        .logo span {
            color: #f59e0b;
        }

        nav a {
            color: #d1d5db;
            text-decoration: none;
            margin-left: 25px;
        }

        nav a:hover {
            color: #f59e0b;
        }

        .hero {
            padding: 70px 8%;
            background: linear-gradient(135deg, #1e293b, #111827);
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .hero h1 span {
            color: #f59e0b;
        }

        .hero p {
            color: #cbd5e1;
            max-width: 600px;
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .search-box {
            display: flex;
            max-width: 500px;
        }

        .search-box input {
            flex: 1;
            padding: 14px;
            border: none;
            border-radius: 6px 0 0 6px;
            font-size: 16px;
        }

        .search-box button {
            padding: 14px 22px;
            border: none;
            background: #f59e0b;
            font-weight: bold;
            cursor: pointer;
            border-radius: 0 6px 6px 0;
        }

        .movies {
            padding: 50px 8%;
        }

        .movies h2 {
            margin-bottom: 30px;
            font-size: 30px;
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
        }

        .movie-card {
            background: #1f2937;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #374151;
            transition: transform 0.2s;
        }

        .movie-card:hover {
            transform: translateY(-5px);
        }

        .poster {
            height: 260px;
            background: linear-gradient(135deg, #374151, #4b5563);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 55px;
        }

        .movie-info {
            padding: 18px;
        }

        .movie-info h3 {
            margin-bottom: 8px;
        }

        .genre {
            color: #f59e0b;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .description {
            color: #9ca3af;
            line-height: 1.5;
            font-size: 14px;
        }

        footer {
            text-align: center;
            padding: 25px;
            background: #0f172a;
            color: #9ca3af;
            margin-top: 30px;
        }
    </style>
</head>

<body>

<header>

    <div class="logo">
        Movie<span>Vault</span>
    </div>

    <nav>
        <a href="#">Home</a>
        <a href="#movies">Movies</a>
        <a href="#about">About</a>
    </nav>

</header>


<section class="hero">

    <h1>Discover Your Next <span>Movie</span></h1>

    <p>
        MovieVault is a simple movie catalog application where
        you can explore movies, genres, ratings and descriptions
        in one place.
    </p>

    <div class="search-box">

        <input
            type="text"
            placeholder="Search movies..."
        >

        <button>
            Search
        </button>

    </div>

</section>


<section class="movies" id="movies">

    <h2>Featured Movies</h2>

    <div class="movie-grid">

        <div class="movie-card">

            <div class="poster">
                🎬
            </div>

            <div class="movie-info">

                <h3>The Last Horizon</h3>

                <div class="genre">
                    Sci-Fi • 2025
                </div>

                <p class="description">
                    A futuristic journey beyond the boundaries
                    of human exploration.
                </p>

            </div>

        </div>


        <div class="movie-card">

            <div class="poster">
                🚀
            </div>

            <div class="movie-info">

                <h3>Beyond Earth</h3>

                <div class="genre">
                    Adventure • 2024
                </div>

                <p class="description">
                    A team of explorers begins an unexpected
                    journey across the galaxy.
                </p>

            </div>

        </div>


        <div class="movie-card">

            <div class="poster">
                🕵️
            </div>

            <div class="movie-info">

                <h3>Hidden Truth</h3>

                <div class="genre">
                    Thriller • 2025
                </div>

                <p class="description">
                    A detective discovers a mystery that changes
                    everything he believed.
                </p>

            </div>

        </div>


        <div class="movie-card">

            <div class="poster">
                ⚔️
            </div>

            <div class="movie-info">

                <h3>Kingdom Rise</h3>

                <div class="genre">
                    Fantasy • 2023
                </div>

                <p class="description">
                    An unlikely hero rises to protect a kingdom
                    from an ancient threat.
                </p>

            </div>

        </div>

    </div>

</section>


<footer id="about">

    <p>
        MovieVault | Built with Java, Maven and Apache Tomcat
    </p>

</footer>

</body>

</html>
