import os
import zipfile
import hashlib

def get_valid_folder(prompt):
    while True:
        folder = input(prompt).strip()
        if os.path.isdir(folder) and any(os.scandir(folder)):
            return folder
        print("Folder does not exist or is empty. Try again.")

version = input("Version name: ").strip()
is_studio = input("Studio? (Y/N): ").strip().upper()
studio_client_dir = input("Studio/Client Directory: ").strip()
content_dir = input("Content Directory: ").strip()
platform_content_dir = input("PlatformContent Directory: ").strip()

shaders_dir = "shaders"

if not os.path.isdir(shaders_dir) or not any(os.scandir(shaders_dir)):
    print("Shaders folder missing or empty.")
    shaders_dir = get_valid_folder("Please enter the Shaders folder path: ")

if is_studio == "Y":
    files = [
        ("redist.zip", ""),
        ("RobloxStudio.zip", "__PACK_MAIN__"),
        ("Libraries.zip", ""),
        ("content-fonts.zip", os.path.join(content_dir, "fonts")),
        ("content-music.zip", os.path.join(content_dir, "music")),
        ("content-particles.zip", os.path.join(content_dir, "particles")),
        ("content-sky.zip", os.path.join(content_dir, "sky")),
        ("content-sounds.zip", os.path.join(content_dir, "sounds")),
        ("content-textures.zip", os.path.join(content_dir, "textures")),
        ("content-textures2.zip", os.path.join(content_dir, "textures")),
        ("content-textures3.zip", os.path.join(platform_content_dir, "pc", "textures")),
        ("content-terrain.zip", os.path.join(platform_content_dir, "pc", "terrain")),
        ("content-scripts.zip", os.path.join(content_dir, "scripts")),
        ("shaders.zip", shaders_dir),
        ("BuiltInPlugins.zip", "BuiltInPlugins"),
        ("imageformats.zip", "imageformats"),
    ]
else:
    files = [
        ("redist.zip", ""),
        ("RobloxApp.zip", "__PACK_MAIN__"),
        ("Libraries.zip", ""),
        ("content-fonts.zip", os.path.join(content_dir, "fonts")),
        ("content-music.zip", os.path.join(content_dir, "music")),
        ("content-particles.zip", os.path.join(content_dir, "particles")),
        ("content-sky.zip", os.path.join(content_dir, "sky")),
        ("content-sounds.zip", os.path.join(content_dir, "sounds")),
        ("content-textures.zip", os.path.join(content_dir, "textures")),
        ("content-textures2.zip", os.path.join(content_dir, "textures")),
        ("content-textures3.zip", os.path.join(platform_content_dir, "pc", "textures")),
        ("content-terrain.zip", os.path.join(platform_content_dir, "pc", "terrain")),
        ("shaders.zip", shaders_dir),
    ]

for zip_name, source_dir in files:
    final_zip_name = f"{version}-{zip_name}"
    zip_path = os.path.join(studio_client_dir, final_zip_name)
    if source_dir == "":
        with zipfile.ZipFile(zip_path, 'w'):
            pass
    elif source_dir == "__PACK_MAIN__":
        with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as z:
            for item in os.listdir(studio_client_dir):
                abs_item = os.path.join(studio_client_dir, item)
                if os.path.isfile(abs_item) and not item.endswith(".zip"):
                    z.write(abs_item, item)
    else:
        with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as z:
            for root, _, files_in_dir in os.walk(source_dir):
                for f in files_in_dir:
                    abs_file = os.path.join(root, f)
                    rel_file = os.path.relpath(abs_file, source_dir)
                    z.write(abs_file, rel_file)

has_content = os.path.isdir(os.path.join(studio_client_dir, "content"))
has_platform_content = os.path.isdir(os.path.join(studio_client_dir, "PlatformContent"))

files_to_hash = []

for root, _, files_in_dir in os.walk(studio_client_dir):
    for f in files_in_dir:
        if f.lower().endswith(".zip"):
            continue
        abs_file = os.path.join(root, f)
        rel_file = os.path.relpath(abs_file, studio_client_dir).replace("\\", "/")
        files_to_hash.append(rel_file)

if not has_content:
    for root, _, files_in_dir in os.walk(content_dir):
        for f in files_in_dir:
            if f.lower().endswith(".zip"):
                continue
            abs_file = os.path.join(root, f)
            rel_file = os.path.relpath(abs_file, content_dir).replace("\\", "/")
            rel_file = f"content/{rel_file}"
            files_to_hash.append((abs_file, rel_file))

if not has_platform_content:
    for root, _, files_in_dir in os.walk(platform_content_dir):
        for f in files_in_dir:
            if f.lower().endswith(".zip"):
                continue
            abs_file = os.path.join(root, f)
            rel_file = os.path.relpath(abs_file, platform_content_dir).replace("\\", "/")
            rel_file = f"PlatformContent/{rel_file}"
            files_to_hash.append((abs_file, rel_file))

manifest_path = os.path.join(studio_client_dir, f"{version}-rbxManifest.txt")

with open(manifest_path, "w") as manifest:
    for item in sorted(files_to_hash, key=lambda x: x if isinstance(x, str) else x[1]):
        if isinstance(item, str):
            abs_file = os.path.join(studio_client_dir, item)
            rel_file = item
        else:
            abs_file, rel_file = item
        h = hashlib.md5()
        with open(abs_file, 'rb') as file_data:
            for chunk in iter(lambda: file_data.read(8192), b''):
                h.update(chunk)
        manifest.write(rel_file + "\n")
        manifest.write(h.hexdigest() + "\n")