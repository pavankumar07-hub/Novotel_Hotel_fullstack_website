# Novotel Hotel Fullstack Website

A full-featured hotel booking web application built with PHP and MySQL.  
Includes admin and user panels, booking management, email notifications (SendGrid), and more.

---

## Features

- User registration, login, and password recovery
- Room booking and management
- Admin dashboard for managing bookings, rooms, facilities, and users
- Email notifications using SendGrid
- Secure handling of sensitive data using environment variables
- Modern UI with Bootstrap

---

## Project Structure

```
updatedone/
│
├── admin/                  # Admin panel (PHP, JS, CSS)
│   ├── admin_ajax/         # AJAX endpoints for admin actions
│   ├── admin_components/   # Shared admin PHP components (db, essentials, etc.)
│   ├── admin_css/          # Admin CSS
│   ├── admin_images/       # Admin images
│   ├── admin_reports.php   # Admin reports page
│   ├── admin_scripts/      # Admin JS
│   ├── booking_records.php # Booking records page
│   ├── carousel.php        # Carousel management
│   └── ...                 # Other admin PHP files
│
├── user_ajax/              # AJAX endpoints for user actions
├── user_components/        # Shared user PHP components (header, footer, SendGrid, etc.)
├── user_css/               # User CSS
├── images/                 # All static images (rooms, users, etc.)
├── .env                    # Environment variables (NOT committed to git)
├── .gitignore              # Git ignore file (includes .env)
├── index.php               # Main landing page
├── about.php               # About page
├── bookings.php            # User bookings page
├── book_now.php            # Booking form
├── ...                     # Other PHP pages
```

---

## Prerequisites

- PHP 7.3 or higher
- MySQL (e.g., via XAMPP)
- Composer (optional, only if you want to use PHP packages)
- [SendGrid account](https://sendgrid.com/) for email notifications

---

## Setup Instructions

### 1. **Clone the Repository**

```sh
git clone https://github.com/yourusername/Novotel_Hotel_fullstack_website.git
cd Novotel_Hotel_fullstack_website
```

### 2. **Configure the Database**

- Create a MySQL database (e.g., `pkhotels`).
- Import your database schema and sample data if provided.

### 3. **Set Up Environment Variables**

Create a file named `.env` in the project root (same folder as `index.php`):

```
SENDGRID_API_KEY=your_actual_sendgrid_api_key
SENDGRID_EMAIL=your_sendgrid_email@example.com
SENDGRID_NAME=Your Name or Company
```

**Important:**  
- Never commit your `.env` file to git.  
- `.env` is already included in `.gitignore`.

### 4. **Configure XAMPP/Apache**

- Place the project folder in your XAMPP `htdocs` directory.
- Start Apache and MySQL from the XAMPP control panel.

### 5. **Access the Application**

- Open your browser and go to:  
  `http://localhost/updatedone/`

---

## Environment Variable Loading (No Composer Needed)

This project uses a simple PHP script to load environment variables from `.env` at runtime (see `admin/admin_components/essentials.php`).  
No external libraries are required.

---

## Security Best Practices

- **Secrets are never hardcoded**: All sensitive data (API keys, emails) are loaded from `.env`.
- **.env is git-ignored**: Your secrets will not be pushed to GitHub.
- **If you ever leak a secret** (e.g., by committing `.env`), follow [these instructions](https://docs.github.com/en/code-security/secret-scanning/removing-a-credential-from-history) to remove it from git history and revoke the key.

---

## Email Sending (SendGrid)

- All transactional emails (registration, password reset, etc.) are sent using SendGrid.
- The API key and sender details are loaded from environment variables.
- To change the sender or key, just update your `.env` file and restart Apache.

---

## Customization

- **Images**: Place your images in the appropriate subfolders under `images/`.
- **CSS/JS**: Customize styles in `user_css/` and `admin/admin_css/`, scripts in `admin/admin_scripts/`.
- **Email Templates**: Edit the HTML in the relevant PHP files for custom email content.

---

## Troubleshooting

- **Emails not sending?**
  - Check your `.env` values.
  - Make sure your SendGrid account is active and the API key is valid.
  - Check your spam folder.

- **Database errors?**
  - Verify your MySQL credentials in `admin/admin_components/db_config.php`.
  - Make sure the database is running and accessible.

- **Environment variables not loading?**
  - Ensure `.env` is in the project root.
  - Restart Apache after changes.

---

## Contributing

Pull requests are welcome!  
Please open an issue first to discuss major changes.

---

## License

This project is licensed under the MIT License.

---

## Acknowledgements

- [SendGrid](https://sendgrid.com/)
- [Bootstrap](https://getbootstrap.com/)
- [XAMPP](https://www.apachefriends.org/)

---

## Contact
pavankumarpalaparthi2004@gmail.com
+91 9652401393

For questions or support, open an issue or contact the maintainer. 
