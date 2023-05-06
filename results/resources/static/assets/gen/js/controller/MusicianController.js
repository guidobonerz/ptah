/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/


async function get(data = {}) {
  const response = await fetch("api/musician/get",{
    method: "GET",
    mode: "cors",
    cache: "no-cache",
    credentials: "same-origin",
    headers: {
      "Content-Type": "application/json",
    },
    redirect: "follow",
    referrerPolicy: "no-referrer",
    body: JSON.stringify(data),
  });
  return response.json();
}

async function list(data = {}) {
  const response = await fetch("api/musician/list",{
    method: "POST",
    mode: "cors",
    cache: "no-cache",
    credentials: "same-origin",
    headers: {
      "Content-Type": "application/json",
    },
    redirect: "follow",
    referrerPolicy: "no-referrer",
    body: JSON.stringify(data),
  });
  return response.json();
}

async function update(data = {}) {
  const response = await fetch("api/musician/update",{
    method: "PUT",
    mode: "cors",
    cache: "no-cache",
    credentials: "same-origin",
    headers: {
      "Content-Type": "application/json",
    },
    redirect: "follow",
    referrerPolicy: "no-referrer",
    body: JSON.stringify(data),
  });
  return response.json();
}

async function delete(data = {}) {
  const response = await fetch("api/musician/delete",{
    method: "DELETE",
    mode: "cors",
    cache: "no-cache",
    credentials: "same-origin",
    headers: {
      "Content-Type": "application/json",
    },
    redirect: "follow",
    referrerPolicy: "no-referrer",
    body: JSON.stringify(data),
  });
  return response.json();
}

/*
get({ answer: 42 }).then((data) => {
  console.log(data);
});

list({ answer: 42 }).then((data) => {
  console.log(data);
});

add({ answer: 42 }).then((data) => {
  console.log(data);
});

update({ answer: 42 }).then((data) => {
  console.log(data);
});

delete({ answer: 42 }).then((data) => {
  console.log(data);
});
 */