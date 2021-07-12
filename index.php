 <?php
// panggil koneksinya
require_once 'koneksi.php';
?>
<!DOCTYPE html>
<html>
<head>
  <title>CRUD dengan PHP MySQLi</title>
</head>
<body>
  <h1>CRUD dengan PHP MySQLi</h1>
  <!-- 
  Create atau menambahkan data baru 
  Data akan dikirimkan ke add.php untuk diproses
  -->
  <form method="post" action="add.php">
    <input type="number" name="ID_BARANG" placeholder="Id Barang">
    <input type="text" name="NAMA_BARANG" placeholder="Nama Barang">
    <input type="number" name="HARGA_BARANG" placeholder="Harga Barang">
    <input type="number" name="QTY" placeholder="Qty">
    <input type="submit" name="submit" value="Tambah Data">
  </form><br/>
  <!-- Read atau menampilkan data dari database -->
  <table border="3">
    <tr>
      <th>No.</th><th>Id Barang</th>
      <th>Nama Barang</th><th>Harga Barang</th>
      <th>Qty</th>
      <th colspan="2">Aksi</th>
    </tr>
    <?php
    // Tampilkan semua data
    $q = $conn->query("SELECT * FROM barang");

    $no = 1; // nomor urut
    while ($dt = $q->fetch_assoc()) :
    ?>
    <tr>  
      <td><?= $no++ ?></td>
      <td><?= $dt['ID_BARANG'] ?></td>
      <td><?= $dt['NAMA_BARANG'] ?></td>
      <td><?= $dt['HARGA_BARANG'] ?></td>
      <td><?= $dt['QTY'] ?></td>
      <td><a href="update.php?id=<?= $dt['ID_BARANG'] ?>">Ubah</a></td>
      <td><a href="delete.php?id=<?= $dt['ID_BARANG'] ?>" 
	  onclick="return confirm('Anda yakin akan menghapus data ini?')">Hapus</a></td>
    </tr>
    <?php
    endwhile;
    ?> 
  </table>
</body>
</html>