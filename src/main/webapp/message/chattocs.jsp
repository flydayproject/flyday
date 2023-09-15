<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
	<title>Flyday - 會員中心</title>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="cha102group1">
	<meta name="description" content="Flyday - 旅遊行程購票及揪團服務平台">

	<!-- Favicon -->
	<link rel="shortcut icon" href="/flyday/front_end/myassets/logo_noliteral.png">
	<link rel="stylesheet" href="/flyday/message/css/styles.css" type="text/css" />

	<!-- Dark mode -->
	<script>
		const storedTheme = localStorage.getItem('theme')

		const getPreferredTheme = () => {
			if (storedTheme) {
				return storedTheme
			}
			return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
		}

		const setTheme = function (theme) {
			if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
				document.documentElement.setAttribute('data-bs-theme', 'dark')
			} else {
				document.documentElement.setAttribute('data-bs-theme', theme)
			}
		}

		setTheme(getPreferredTheme())

		window.addEventListener('DOMContentLoaded', () => {
				var el = document.querySelector('.theme-icon-active');
			if(el != 'undefined' && el != null) {
				const showActiveTheme = theme => {
				const activeThemeIcon = document.querySelector('.theme-icon-active use')
				const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)
				const svgOfActiveBtn = btnToActive.querySelector('.mode-switch use').getAttribute('href')

				document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
					element.classList.remove('active')
				})

				btnToActive.classList.add('active')
				activeThemeIcon.setAttribute('href', svgOfActiveBtn)
			}

			window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
				if (storedTheme !== 'light' || storedTheme !== 'dark') {
					setTheme(getPreferredTheme())
				}
			})

			showActiveTheme(getPreferredTheme())

			document.querySelectorAll('[data-bs-theme-value]')
				.forEach(toggle => {
					toggle.addEventListener('click', () => {
						const theme = toggle.getAttribute('data-bs-theme-value')
						localStorage.setItem('theme', theme)
						setTheme(theme)
						showActiveTheme(theme)
					})
				})

			}
		})
		
	</script>

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/flyday/front_end/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/flyday/front_end/assets/vendor/bootstrap-icons/bootstrap-icons.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/flyday/front_end/assets/css/style.css">

	<style>
	.mycollapse {
		list-style: none;
	}

	.my-cart-number{
		padding: .0625rem .185rem;
	}

	.my-card-image{
		width: 100%;
		height: 100%;
	}

	.change-img-div{
		position: relative;
	}

	.change-img-btn{
		position: absolute; 
		right: 20px;
		top: 25px;
	}

	</style>

</head>

<body class="dashboard" onload="connect();" onunload="disconnect();">
	
	<!-- Header START -->
<header class="navbar-light header-sticky">
    <!-- Logo Nav START -->
    <nav class="navbar navbar-expand-xl">
      <div class="container">
        <!-- Logo START -->
        <a class="navbar-brand" href="/flyday/front_end/index.html">
          <img class="light-mode-item navbar-brand-item" src="/flyday/front_end/myassets/logo.svg" alt="logo">
          <img class="dark-mode-item navbar-brand-item" src="/flyday/front_end/myassets/logo.svg" alt="logo">
        </a>
        <!-- Logo END -->

        <!-- Responsive navbar toggler -->
        <button class="navbar-toggler ms-auto mx-3 me-0 p-0 p-sm-2" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
          aria-label="Toggle navigation">
          <span class="navbar-toggler-animation">
            <span></span>
            <span></span>
            <span></span>
          </span>
        </button>

        <!-- Main navbar START -->
        <div class="navbar-collapse collapse" id="navbarCollapse">
          <ul class="navbar-nav navbar-nav-scroll">

            <!-- Nav item 行程 -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="listingMenu" data-bs-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">觀光行程</a>
              <ul class="dropdown-menu" aria-labelledby="listingMenu">
                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">行程搜尋</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">遊船觀光</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">單車旅遊</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">文化體驗</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">水上活動</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">露營登山</a>
                </li>
              </ul>
            </li>

            <!-- Nav item 票券 -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="pagesMenu" data-bs-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">景點門票</a>
              <ul class="dropdown-menu" aria-labelledby="pagesMenu">

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="/flyday/tktt/tkt-list.html">門票搜尋</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">主題樂園</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">景點門票</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">水族館</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">動物園</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">博物館</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">美術館</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">展覽</a>
                </li>

                <!-- Dropdown submenu -->
                <li class="dropdown-submenu dropend">
                  <a class="dropdown-item" href="#">其他票券</a>
                </li>

              </ul>
            </li>

            <!-- Nav item 揪團 -->
            <li class="nav-item dropdown">
              <a class="nav-link" href="/flyday/Act/hotel-grid.html" id="accounntMenu" aria-haspopup="true" aria-expanded="false">揪團活動</a>
            </li>

            <!-- Nav item Contact -->
            <li class="nav-item"> <a class="nav-link" href="/flyday/front_end/Frequent-QA.html">常見問題</a></li>
          </ul>
        </div>
        <!-- Main navbar END -->

        <!-- Profile and Notification START +購物車 -->
        <ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">

          <!-- 購物車 dropdown START -->
          <li class="nav-item ms-0 ms-3 dropdown">
            <!-- 購物車 button -->
            <a class="nav-link p-0" href="#cartOffcanvas" data-bs-toggle="offcanvas" role="button" aria-expanded="false"
              data-bs-auto-close="outside">
              <!-- 購物車數量 -->
              <span class="badge bg-primary fs-xs position-absolute end-0 top-0 me-n1 my-cart-number">3</span>
              <i class="bi bi-cart fa-fw fs-5"></i>
            </a>
          </li>


          <!-- Notification dropdown START -->
          <!-- <li class="nav-item ms-0 ms-3 dropdown"> -->
            <!-- Notification button -->
            <!-- <a class="nav-link p-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"
              data-bs-auto-close="outside">
              <i class="bi bi-bell fa-fw fs-5"></i>
            </a> -->
            <!-- Notification dote -->
            <!-- <span class="notif-badge animation-blink"></span> -->

            <!-- Notification dropdown menu START -->
            <!-- <div class="dropdown-menu dropdown-animation dropdown-menu-end dropdown-menu-size-md p-0 shadow-lg">
              <div class="card bg-transparent"> -->
                <!-- Card header -->
                <!-- <div class="card-header bg-transparent d-flex justify-content-between align-items-center border-bottom">
                  <h6 class="m-0">通知<span class="badge bg-danger bg-opacity-10 text-danger ms-2">?筆新通知</span></h6>
                  <a class="small" href="#">清除全部</a>
                </div> -->

                <!-- Card body START -->
                <!-- <div class="card-body p-0">
                  <ul class="list-group list-group-flush list-unstyled p-2"> -->
                    <!-- Notification item -->
                    <!-- <li>
                      <a href="#" class="list-group-item list-group-item-action rounded notif-unread border-0 mb-1 p-3">
                        <h6 class="mb-2">排程器送來的通知</h6>
                        <p class="mb-0 small">Find the flexible ticket on flights around the
                          world. Start searching today</p>
                        <span>Wednesday</span>
                      </a>
                    </li> -->
                    <!-- Notification item -->
                    <!-- <li>
                      <a href="#" class="list-group-item list-group-item-action rounded border-0 mb-1 p-3">
                        <h6 class="mb-2">Sunshine saving are here 🌞 save 30% or more on a stay
                        </h6>
                        <span>15 Nov 2022</span>
                      </a>
                    </li>
                  </ul>
                </div> -->
                <!-- Card body END -->

                <!-- Card footer -->
                <!-- <div class="card-footer bg-transparent text-center border-top">
                  <a href="#" class="btn btn-sm btn-link mb-0 p-0">查看所有通知</a>
                </div>
              </div>
            </div> -->
            <!-- Notification dropdown menu END -->
          <!-- </li> -->
          <!-- Notification dropdown END -->

          <!-- Profile dropdown START -->
          <li class="nav-item ms-3 dropdown">
            <!-- Avatar -->
            <a class="avatar avatar-xs p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
              data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
              <img class="avatar-img rounded-circle my-mem-pic" src="/flyday/front_end/myassets/logo_noliteral.png" alt="avatar">
            </a>

            <!-- Profile dropdown START -->
            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
              aria-labelledby="profileDropdown">
              <!-- Profile info -->
              <li class="px-3 mb-3">
                <div class="d-flex align-items-center">
                  <!-- Avatar -->
                  <div class="avatar me-3">
                    <img class="avatar-img rounded-circle shadow my-mem-pic" src="/flyday/front_end/myassets/logo_noliteral.png" alt="avatar">
                  </div>
                  <div>
                    <a class="h6 mt-2 mt-sm-0 my-acc" href="#">testacc01</a>
                    <p class="small m-0 my-mem-level">普通會員</p>
                  </div>
                </div>
              </li>

              <!-- Links -->
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="/flyday/front_end/account-profile.html"><i class="bi bi-person fa-fw me-2"></i>基本資料設定</a></li>
              <li><a class="dropdown-item" href="#"><i class="bi bi-card-list fa-fw me-2"></i>我的訂單</a>
              </li>
              <li><a class="dropdown-item" href="#"><i class="bi bi-envelope-paper fa-fw me-2"></i>我的優惠券</a></li>
              <li><a class="dropdown-item" href="#"><i class="bi bi bi-heart fa-fw me-2"></i>我的收藏</a></li>
              <li><a class="dropdown-item" href="/flyday/Act/account-bookings.html"><i class="fa-solid fa-people-group fa-fw me-2"></i>我的揪團</a></li>
              <li><a class="dropdown-item" href="/flyday/chat.do"><i class="bi bi-chat-left-text fa-fw me-2"></i>聯繫客服</a></li>
              <li><a class="dropdown-item bg-danger-soft-hover" id="logoutNav" href="#"><i class="bi bi-power fa-fw me-2"></i>登出</a>
              </li>
              <li>
                <hr class="dropdown-divider">
              </li>

              <!-- Dark mode options START -->
              <li>
                <div
                  class="nav-pills-primary-soft theme-icon-active d-flex justify-content-between align-items-center p-2 pb-0">
                  <span>Mode:</span>
                  <button type="button" class="btn btn-link nav-link text-primary-hover mb-0 p-0"
                    data-bs-theme-value="light" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Light">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                      class="bi bi-sun fa-fw mode-switch" viewBox="0 0 16 16">
                      <path
                        d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
                      <use href="#"></use>
                    </svg>
                  </button>
                  <button type="button" class="btn btn-link nav-link text-primary-hover mb-0 p-0"
                    data-bs-theme-value="dark" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Dark">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                      class="bi bi-moon-stars fa-fw mode-switch" viewBox="0 0 16 16">
                      <path
                        d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278zM4.858 1.311A7.269 7.269 0 0 0 1.025 7.71c0 4.02 3.279 7.276 7.319 7.276a7.316 7.316 0 0 0 5.205-2.162c-.337.042-.68.063-1.029.063-4.61 0-8.343-3.714-8.343-8.29 0-1.167.242-2.278.681-3.286z" />
                      <path
                        d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
                      <use href="#"></use>
                    </svg>
                  </button>
                  <button type="button" class="btn btn-link nav-link text-primary-hover mb-0 p-0 active"
                    data-bs-theme-value="auto" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Auto">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                      class="bi bi-circle-half fa-fw mode-switch" viewBox="0 0 16 16">
                      <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
                      <use href="#"></use>
                    </svg>
                  </button>
                </div>
              </li>
              <!-- Dark mode options END-->
            </ul>
            <!-- Profile dropdown END -->
          </li>
          <!-- Profile dropdown END -->

        </ul>
        <!-- Profile and Notification End -->

      </div>
    </nav>
    <!-- Logo Nav END -->
    <!-- Cart offcanvas-->
    <div class="offcanvas offcanvas-end py-2 p-sm-4 p-md-5" id="cartOffcanvas" style="width: 680px;">
      <!-- Title -->
      <div class="px-2 pt-3">
        <div class="d-flex justify-content-between align-items-center border-bottom">
          <h4 class="offcanvas-title d-flex align-items-center mb-2">你的購物車
            <span class="fs-base fw-normal text-muted ms-3">(3 items)</span>
          </h4>
          <button class="btn-close mb-1 me-n1" type="button" data-bs-dismiss="offcanvas"
            data-bs-target="#cartOffcanvas"></button>
        </div>
      </div>

      <ul class="nav nav-tabs nav-justified mb-3">
        <li class="nav-item"> <a class="nav-link active" data-bs-toggle="tab" href="#tab-pkg" id="my_pkg_cart">行程購物車</a>
        </li>
        <li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#tab-tkt" id="my_tkt_cart">票券購物車 </a> </li>
      </ul>
      <!--購物車清單範圍-->
	<div class="offcanvas-body">
    <div class="tab-content">
      <div class="tab-pane show active" id="tab-pkg">
      <!-- items -->
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
        <!-- <div class="col-md-1 d-flex">
          <div class="form-check align-self-center">
          <input class="form-check-input pkg-cart-check" type="checkbox" value="" name="pkg-check" id="pkg-check1">
          </div>
        </div> -->
        <div class="col-md-5">
          <img src="https://picsum.photos/500/400?random=4" class="img-fluid rounded-start my-card-image">
        </div>
        <div class="col-md-7">
          <div class="card-body">
          <h5 class="card-title">行程標題1</h5>
          <p class="card-text">行程方案行程方案行程方案行程方案行程方案行程方案行程方案</p>
          <div class="d-flex justify-content-end">
            <p class="m-0 align-self-center me-auto text-primary">$22</p>
          </div>
          </div>
        </div>
        </div>
      </div>
      <!-- items -->
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
        <!-- <div class="col-md-1 d-flex">
          <div class="form-check align-self-center">
          <input class="form-check-input pkg-cart-check" type="checkbox" value="" name="pkg-check" id="pkg-check2">
          </div>
        </div> -->
        <div class="col-md-5">
          <img src="https://picsum.photos/500/400?random=5" class="img-fluid rounded-start my-card-image">
        </div>
        <div class="col-md-7">
          <div class="card-body">
          <h5 class="card-title">行程標題2</h5>
          <p class="card-text">行程方案行程方案行程方案行程方案行程方案行程方案行程方案</p>
          <div class="d-flex justify-content-end">
            <p class="m-0 align-self-center me-auto text-primary">$22</p>
          </div>
          </div>
        </div>
        </div>
      </div>
      
      <!-- items end-->
      </div>
      <div class="tab-pane" id="tab-tkt">
      <!-- items -->
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
        <!-- <div class="col-md-1 d-flex">
          <div class="form-check align-self-center">
          <input class="form-check-input tkt-cart-check" type="checkbox" value="" name="tkt-check" id="tkt-check1">
          </div>
        </div> -->
        <div class="col-md-5">
          <img src="https://picsum.photos/500/400?random=3" class="img-fluid rounded-start my-card-image">
        </div>
        <div class="col-md-7">
          <div class="card-body">
          <h5 class="card-title">票券標題1</h5>
          <p class="card-text">方案名稱1</p>
          <div class="d-flex justify-content-end">
            <p class="m-0 align-self-center me-auto text-primary">$22</p>
            <button class="btn btn-icon fs-xl my-minus-btn" type="button" data-decrement>-</button>
            <input class="form-control w-25 my-cart-quantity"type="number" value="1" readonly>
            <button class="btn btn-icon fs-xl my-plus-btn" type="button" data-increment>+</button>
          </div>
          </div>
        </div>
        </div>
      </div>
      <!-- items -->
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
        <!-- <div class="col-md-1 d-flex">
          <div class="form-check align-self-center">
          <input class="form-check-input tkt-cart-check" type="checkbox" value="" name="tkt-check" id="tkt-check2">
          </div>
        </div> -->
        <div class="col-md-5">
          <img src="https://picsum.photos/500/400?random=1" class="img-fluid rounded-start my-card-image">
        </div>
        <div class="col-md-7">
          <div class="card-body">
          <h5 class="card-title">票券標題2</h5>
          <p class="card-text">方案名稱2</p>
          <div class="d-flex justify-content-end">
            <p class="m-0 align-self-center me-auto text-primary">$22</p>
            <button class="btn btn-icon fs-xl my-minus-btn" type="button" data-decrement>-</button>
            <input class="form-control w-25 my-cart-quantity"type="number" value="1" readonly>
            <button class="btn btn-icon fs-xl my-plus-btn" type="button" data-increment>+</button>
          </div>
          </div>
        </div>
        </div>
      </div>
      
      <!-- items end-->
      </div>
    </div>
    </div>
      <!-- Action buttons-->
    <div class="container px-4">
      <div class="row g-0 mt-3 justify-content-between">
        <!-- <div class="col-3 d-flex ps-1"> -->
          <!-- <div class="form-check align-self-center ps-4"> -->
            <!-- <input class="form-check-input pkg-cart-check" type="checkbox" id="check-all"> -->
            <!-- <label class="form-check-label" for="check-all" id="check-all-content">全選行程</label> -->
          <!-- </div> -->
        <!-- </div> -->
        <div class="col-3 align-self-center ps-3 pb-3">
          <div class="fs-xl me-3">總金額:</div>
          <div class="h4 mb-0 text-primary">$92.00</div>
        </div>
        <div class="col-3 pb-3 mt-3 d-flex flex-row-reverse">
          <a class="btn btn-lg btn-primary" href="#" id="btn_cart">行程結帳<i class="ai-chevron-right ms-2 me-n1"></i></a>
        </div>
        </div>
    </div>        
</header>
<!-- Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Content START -->
<section class="pt-3">
	<div class="container">
		<div class="row g-2 g-lg-4">

			<!-- Sidebar START -->
					<div class="col-lg-4 col-xl-3">
						<!-- Responsive offcanvas body START -->
						<div class="offcanvas-lg offcanvas-end" tabindex="-1" id="offcanvasSidebar">
						<!-- Offcanvas header -->
						<div class="offcanvas-header justify-content-end pb-2">
							<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar"
							aria-label="Close"></button>
						</div>

						<!-- Offcanvas body -->
						<div class="offcanvas-body p-3 p-lg-0">
							<div class="card bg-light w-100">

							<!-- Card body START -->
							<div class="card-body p-3">
								<!-- Avatar and content -->
								<div class="text-center mb-3">
								<!-- Avatar -->
								<div class="avatar avatar-xl mb-2 change-img-div">
									<img class="avatar-img rounded-circle border border-2 border-white change-img my-mem-pic" src="/flyday/front_end/myassets/logo_noliteral.png">
								</div>
								<h6 class="mb-0 my-acc">testacc01</h6>
									<div class="mt-1"><span class="my-email">hello@gmail.com</span></div>
									<div class="mt-1"><a href="#" class="text-reset text-primary-hover small"><p class="my-mem-level">普通會員</p></a></div>
								<hr>
								</div>

								<!-- Sidebar menu item START -->
								<ul class="nav nav-pills-primary-soft flex-column">
								<li class="nav-item">
									<a class="nav-link" href="/flyday/front_end/account-profile.html"><i
										class="bi bi-person fa-fw me-2"></i>基本資料設定</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="collapse" href="#collapseExample1"><i
										class="bi bi-card-list fa-fw me-2"></i>我的訂單</a>
									<ul class="collapse mycollapse" id="collapseExample1">
									<a class="nav-link" href="###">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="fa-solid fa-plane-departure fa-fw me-2"></i>行程訂單
										</li>
									</a>
									<a class="nav-link" href="###">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="bi bi-ticket-perforated fa-fw me-2"></i>票券訂單</li>
									</a>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="collapse" href="#collapseExample2"><i
										class="bi bi-envelope-paper fa-fw me-2"></i>我的優惠券</a>
									<ul class="collapse mycollapse" id="collapseExample2">
									<a class="nav-link" href="###">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="fa-solid fa-plane-departure fa-fw me-2"></i>行程優惠券
										</li>
									</a>
									<a class="nav-link" href="###">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="bi bi-ticket-perforated fa-fw me-2"></i>票券優惠券
										</li>
									</a>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="collapse" href="#collapseExample3"><i
										class="bi bi-heart fa-fw me-2"></i>我的收藏</a>
									<ul class="collapse mycollapse" id="collapseExample3">
									<a class="nav-link" href="###">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="fa-solid fa-plane-departure fa-fw me-2"></i>行程收藏
										</li>
									</a>
									<a class="nav-link" href="###">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="bi bi-ticket-perforated fa-fw me-2"></i>票券收藏</li>
									</a>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="collapse" href="#collapseExample4"><i
										class="fa-solid fa-people-group fa-fw me-2"></i>我的揪團</a>
									<ul class="collapse mycollapse" id="collapseExample4">
									<a class="nav-link" href="/flyday/Act/account-bookings.html">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="bi bi-person-fill-check fa-fw me-2"></i>團主活動管理
										</li>
									</a>
									<a class="nav-link" href="/flyday/Act/account-myjoin.html">
										<li class="text-dark-emphasis nav-item ps-2"><i
											class="bi bi-person-plus fa-fw me-2"></i>參與揪團紀錄</li>
									</a>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link active" href="/flyday/chat.do"><i
										class="bi bi-chat-left-text fa-fw me-2"></i>聯繫客服</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-danger bg-danger-soft-hover" id="logoutSide" href="#"><i
										class="fas fa-sign-out-alt fa-fw me-2"></i>登出</a>
								</li>
								</ul>
								<!-- Sidebar menu item END -->
							</div>
							<!-- Card body END -->
							</div>
						</div>
						</div>
						<!-- Responsive offcanvas body END -->
					</div>
					<!-- Sidebar END -->

			<!-- Main content START -->
			<div class="col-lg-8 col-xl-9 ps-xl-5" id="chatbox-area">

				<!-- Offcanvas menu button -->
				<div class="d-grid mb-0 d-lg-none w-100">
					<button class="btn btn-primary mb-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fas fa-sliders-h"></i> 目錄
					</button>
				</div>

				<h6 id="statusOutput" class="statusOutput"></h6>
				<textarea id="messagesArea" class="panel message-area" readonly></textarea>
				<div class="panel input-area">
					<input id="message" class="text-field form-control" type="text" placeholder="輸入訊息..." onkeydown="if (event.keyCode == 13) sendMessage();" /> 
					<input type="submit" id="sendMessage" class="button btn btn-sm btn-light" value="傳送" onclick="sendMessage();" /> 
					<input type="button" id="connect" class="button btn btn-sm btn-light" value="連線" onclick="connect();" /> 
					<input type="button" id="disconnect" class="button btn btn-sm btn-light" value="斷線" onclick="disconnect();" />
				</div>
				
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
<!-- =======================
Content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

 <!-- =======================
Footer START -->
<footer class="bg-dark p-3">
    <div class="container">
      <div class="row align-items-center">

        <!-- Widget -->
        <div class="col-md-4">
          <div class="text-center text-md-start mb-3 mb-md-0">
            <a href="/flyday/front_end/index.html"> <img class="h-30px" src="/flyday/front_end/myassets/logo.svg" alt="logo"> </a>
          </div>
        </div>

        <!-- Widget -->
        <div class="col-md-4">
          <div class="text-muted text-primary-hover text-center">Graduation Project for Tibame.CHA102.Group1</div>
        </div>

        <!-- Widget -->
        <div class="col-md-4">
          <ul class="list-inline mb-0 text-center text-md-end">
            <li class="list-inline-item ms-2"><a href="#"><i class="text-white fab fa-facebook"></i></a>
            </li>
            <li class="list-inline-item ms-2"><a href="#"><i class="text-white fab fa-instagram"></i></a>
            </li>
            <li class="list-inline-item ms-2"><a href="#"><i class="text-white fab fa-linkedin-in"></i></a>
            </li>
            <li class="list-inline-item ms-2"><a href="#"><i class="text-white fab fa-twitter"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
</footer>
<!-- =======================Footer END -->

<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script src="/flyday/front_end/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- ThemeFunctions -->
<script src="/flyday/front_end/assets/js/functions.js"></script>

<!--導覽列+側邊欄js-->
<script src="/flyday/front_end/myassets/js/nav-side.js"></script>
			
<!-- 聊天室JS -->
<script>
	var MyPoint = "/FriendWS/${userName}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var self = '${userName}';
	var webSocket;

	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			updateStatus("客服已連線");
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('connect').disabled = true;
			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
			var jsonObj = JSON.parse(event.data);
			var message = jsonObj.sender + ": " + jsonObj.message + "\r\n";
			messagesArea.value = messagesArea.value + message;
			messagesArea.scrollTop = messagesArea.scrollHeight;
		};

		webSocket.onclose = function(event) {
			updateStatus("客服已斷線");
		};
	}

	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else {
			var jsonObj = {
					"type" : "chat",
					"sender" : self,
					"receiver" : "cs",
					"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}

	function disconnect() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}

	function updateStatus(newStatus) {
		statusOutput.innerHTML = newStatus;
	}
</script>

</body>
</html>