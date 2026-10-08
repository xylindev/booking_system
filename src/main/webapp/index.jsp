<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking System</title>
    
    <!-- 1. Import du CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <!-- Exemple d'utilisation des classes Bootstrap -->
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-body text-center">
                <h1 class="text-primary mb-4">Système de réservation</h1>
                <p class="lead">Bienvenue sur l'application.</p>
                
                <!-- Ce bouton pointe vers votre Servlet Planning -->
                <a href="calendar" class="btn btn-success btn-lg">Voir le planning</a>
            </div>
        </div>
    </div>

    <!-- 2. Import du Javascript Bootstrap (nécessaire pour les menus déroulants, modales, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>