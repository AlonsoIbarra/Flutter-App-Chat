Create table users(
	id BIGSERIAL PRIMARY_KEY,
	email varchar(255) not NULL UNIQUE,
	name varchar(255) not NULL,
	phone varchar(80) not NULL,
	image varchar(255) NULL,
	is_availabe BOOLEAN NULL,
	session_token varchar(255) NULL,
	password varchar(255) NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
);

INSERT INTO users (
	email,
	name,
	phone,
	image,
	is_availabe,
	session_token,
	password,
	created_at,
	updated_at
)
VALUES()

SELECT
	id,
	email,
	name,
	image,
	phone,
	password,
	session_token
FROM users
WHERE
	id=0;